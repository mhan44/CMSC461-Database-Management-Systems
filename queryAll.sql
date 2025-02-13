-- Query 1 List the name, city, and email (any single email suffices) of all folks.
SELECT F.first_name, F.last_name, F.nickname, F.residence_city, FE.email_address
FROM Folks F
LEFT JOIN Folks_email FE ON F.person_id = FE.id;

-- Query 2 List the city, state, and the number of residents of each city in Wonderland (skip cities with no residents) 
-- in decreasing order of number of residents.
SELECT residence_city AS city, residence_state AS state, COUNT(*) AS num_residents
FROM Folks
GROUP BY residence_city, residence_state
HAVING COUNT(*) > 0
ORDER BY num_residents DESC;

-- Query 3 List each center together with its number of currently registered folks 
-- (include states with no inhabited places) in increasing alphabetical order of their zipcode.
SELECT VC.street_number, VC.street_name, VC.city, VC.state, VC.zipcode, 
       COUNT(VR.registry_id) AS num_registered
FROM VotingCenter VC
LEFT JOIN VotingRegistry VR 
    ON VC.street_number = VR.street_number 
   AND VC.street_name = VR.street_name 
   AND VC.city = VR.city 
   AND VC.state = VR.state 
   AND VC.zipcode = VR.zipcode
GROUP BY VC.street_number, VC.street_name, VC.city, VC.state, VC.zipcode
ORDER BY VC.zipcode;

-- Query 4 Find the distinct identifiers and names of folks registered at a given voting center within a given time period.
-- @center_acronym and @start_date and @end_date are scripting variables.
SET @center_acronym = 'VC01';
SET @start_date = '2024-11-01';
SET @end_date = '2024-11-04';

SELECT DISTINCT F.person_id, F.first_name, F.last_name, F.nickname
FROM Folks F
JOIN VotingRegistry VR ON F.person_id = VR.person_id
WHERE VR.acronym = @center_acronym
  AND VR.vote_time BETWEEN @start_date AND @end_date;

-- Query 5 Find for a given month, the number of unique registrations at any voting center 
-- which is within 5 miles from the center of Megapolis, except for voting centers in a given (exclusion) list of voting centers.
-- @month, @excluded_centers are scripting variables.
SET @month = '2024-11';
SET @excluded_centers = '("VC01", "VC03")';
SET @megapolis_x = 0;
SET @megapolis_y = 0;

SELECT COUNT(DISTINCT VR.registry_id) AS num_unique_registrations
FROM VotingRegistry VR
JOIN Places P ON VR.street_number = P.street_number 
   AND VR.street_name = P.street_name 
   AND VR.city = P.city 
   AND VR.state = P.state 
   AND VR.zipcode = P.zipcode
WHERE P.coordinates IS NOT NULL
  AND (
      POW(SUBSTRING_INDEX(P.coordinates, ',', 1) - @megapolis_x, 2) + 
      POW(SUBSTRING_INDEX(P.coordinates, ',', -1) - @megapolis_y, 2)
  ) <= POW(5, 2) -- 5 miles distance
  -- for the given month
  AND DATE_FORMAT(VR.vote_time, '%Y-%m') = @month
  AND VR.acronym NOT IN ('VC02', 'VC03');
  
-- Query 6 Most popular voting center(s) in a given city for a time period
-- @city and @start_date, @end_date are scripting variables
SET @city = 'City1';
SET @start_date = '2024-11-01';
SET @end_date = '2024-11-30';

SELECT VR.acronym, COUNT(*) AS total_registrations
FROM VotingRegistry VR
INNER JOIN Places P USING (street_number, street_name, city, state, zipcode)
WHERE P.city = @city
  AND VR.vote_time BETWEEN @start_date AND @end_date
GROUP BY VR.acronym
HAVING COUNT(*) = (
    SELECT MAX(total)
    FROM (
        SELECT COUNT(*) AS total
        FROM VotingRegistry VR
        JOIN Places P USING (street_number, street_name, city, state, zipcode)
        WHERE P.city = @city
          AND VR.vote_time BETWEEN @start_date AND @end_date
        GROUP BY VR.acronym
    ) subquery
);

-- Query 7 Unique folks with valid registrations at every voting center in a state
-- @state is a scripting variable
SET @state = 'State1';

SELECT DISTINCT F.person_id, F.first_name, F.last_name
FROM Folks F
WHERE NOT EXISTS (
    SELECT VC.acronym
    FROM VotingCenter VC
    WHERE VC.state = @state
      AND NOT EXISTS (
          SELECT 1
          FROM VotingRegistry VR
          WHERE VR.person_id = F.person_id
            AND VR.acronym = VC.acronym
      )
);

-- Query 8: Folks registered at a voting center farther than the closest to their residence
SELECT DISTINCT F.person_id, F.first_name, F.last_name, VR.acronym AS registered_center
FROM Folks F
JOIN VotingRegistry VR USING (person_id)
JOIN Places PR ON PR.street_number = F.residence_street_number 
              AND PR.street_name = F.residence_street_name 
              AND PR.city = F.residence_city 
              AND PR.state = F.residence_state 
              AND PR.zipcode = F.residence_zipcode
JOIN Places PV ON PV.street_number = VR.street_number 
              AND PV.street_name = VR.street_name 
              AND PV.city = VR.city 
              AND PV.state = VR.state 
              AND PV.zipcode = VR.zipcode
WHERE (
        POW(SUBSTRING_INDEX(PV.coordinates, ',', 1) - SUBSTRING_INDEX(PR.coordinates, ',', 1), 2) +
        POW(SUBSTRING_INDEX(PV.coordinates, ',', -1) - SUBSTRING_INDEX(PR.coordinates, ',', -1), 2)
      ) > (
        SELECT MIN(
            POW(SUBSTRING_INDEX(PC.coordinates, ',', 1) - SUBSTRING_INDEX(PR.coordinates, ',', 1), 2) +
            POW(SUBSTRING_INDEX(PC.coordinates, ',', -1) - SUBSTRING_INDEX(PR.coordinates, ',', -1), 2)
        )
        FROM VotingCenter VC
        JOIN Places PC ON PC.street_number = VC.street_number 
                       AND PC.street_name = VC.street_name 
                       AND PC.city = VC.city 
                       AND PC.state = VC.state 
                       AND PC.zipcode = VC.zipcode
    )
ORDER BY F.person_id, VR.acronym;

-- Query 9 Find the closest voting center to a folk's residence on a specific date
-- @folk_id and @check_date are scripting variables
SET @folk_id = '0000000000000001'; -- Replace with the desired folk ID
SET @check_date = '2024-11-01';     -- Replace with the desired date

SELECT VC.acronym AS closest_center
FROM VotingCenter VC
JOIN Places PC ON PC.street_number = VC.street_number 
               AND PC.street_name = VC.street_name 
               AND PC.city = VC.city 
               AND PC.state = VC.state 
               AND PC.zipcode = VC.zipcode
JOIN Folks F ON F.person_id = @folk_id
JOIN Places PR ON PR.street_number = F.residence_street_number 
               AND PR.street_name = F.residence_street_name 
               AND PR.city = F.residence_city 
               AND PR.state = F.residence_state 
               AND PR.zipcode = F.residence_zipcode
WHERE EXISTS (
    SELECT 1
    FROM Center_times CT
    WHERE CT.acronym = VC.acronym
      AND CT.start_time <= @check_date
      AND CT.end_time >= @check_date
)
ORDER BY (
    POW(SUBSTRING_INDEX(PC.coordinates, ',', 1) - SUBSTRING_INDEX(PR.coordinates, ',', 1), 2) +
    POW(SUBSTRING_INDEX(PC.coordinates, ',', -1) - SUBSTRING_INDEX(PR.coordinates, ',', -1), 2)
), VC.acronym
LIMIT 1;


-- Query 10 Cross-tabulation of voting centers and ballot options for a given ballot
-- @ballot_id is a scripting variable
SET @ballot_id = 'B001';

SELECT VC.acronym AS voting_center,
       SUM(CASE WHEN CV.choice = 'YES' THEN 1 ELSE 0 END) AS votes_yes,
       SUM(CASE WHEN CV.choice = 'NO' THEN 1 ELSE 0 END) AS votes_no,
       SUM(CASE WHEN CV.choice = 'ABSTAIN' THEN 1 ELSE 0 END) AS votes_abstain
FROM CastedVote CV
JOIN VotingCenter VC USING (acronym)
WHERE CV.ballot_id = @ballot_id
GROUP BY VC.acronym
ORDER BY VC.acronym;