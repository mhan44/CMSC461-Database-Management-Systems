create DATABASE IF NOT EXISTS wonderland;
SHOW DATABASES;
USE wonderland;

-- Create Places Table first, since Folks has a FKRC to Places
-- Use VARCHAR for coordinates, since you cannot use the UNIQUE constraint on POINT.
CREATE TABLE IF NOT EXISTS Places (
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    coordinates VARCHAR(30),
    location_type ENUM('residence', 'voting_center') NOT NULL,
    PRIMARY KEY (street_number, street_name, city, state, zipcode),
    UNIQUE (coordinates)
);

-- Create Folks Table
-- DATE for date_of_birth
-- ON DELETE CASCADE is used for the FKRC to places, because a person cannot live nowhere(in wonderland)
-- CHAR for phone numbers and ID, since they are fixed length 
-- Phone numbers are UNIQUE, and CHECK if primary and secondary numbers are not equal to each other, because
-- it is redundant to have one number for both primary and secondary
CREATE TABLE IF NOT EXISTS Folks (
    person_id CHAR(16),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    nickname VARCHAR(50),
    date_of_birth DATE NOT NULL,
    primary_phone CHAR(10),
    secondary_phone CHAR(10),
    residence_street_number VARCHAR(10),
    residence_street_name VARCHAR(100),
    residence_city VARCHAR(100),
    residence_state VARCHAR(50),
    residence_zipcode VARCHAR(9),
    PRIMARY KEY(person_id),
	FOREIGN KEY (residence_street_number, residence_street_name, 
		residence_city, residence_state, residence_zipcode)
		REFERENCES Places (street_number, street_name, city, state, zipcode)
		ON DELETE CASCADE,
	UNIQUE(primary_phone, secondary_phone),
    CHECK (primary_phone <> secondary_phone)
);

-- Create weak entity Folks_email 
-- ON DELETE CASCADE, since an email can't belong to nobody
CREATE TABLE IF NOT EXISTS Folks_email (
    id CHAR(16),
    email_address VARCHAR(150),
    PRIMARY KEY (id, email_address),
    FOREIGN KEY (id) REFERENCES Folks(person_id) ON DELETE CASCADE,
    UNIQUE(email_address)
);

-- Create VotingCenter Table
-- CHAR for acronym since it is fixed to 4 alphanumeric characters
-- ON DELETE CASCADE, since a VotingCenter can't exist at no place
-- UNIQUE for acronym since it is the unique discriminator
CREATE TABLE IF NOT EXISTS VotingCenter (
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    acronym CHAR(4),
    PRIMARY KEY (street_number, street_name, city, state, zipcode, acronym),
    FOREIGN KEY (street_number, street_name, city, state, zipcode)
        REFERENCES Places (street_number, street_name, city, state, zipcode)
        ON DELETE CASCADE,
	UNIQUE (acronym)
);

-- Create weak entity Center_times
-- For operating_period, split it into 2 new attributes: start_time, end_time, since it is hard to work
-- with only 1 variable for a range of time
-- ON DELTE CASCADE, since an operating time cannot be set for no VotingCenter
-- CHECK that start_time < end_time
CREATE TABLE IF NOT EXISTS Center_times (
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    acronym CHAR(4),
    start_time DATETIME,
    end_time DATETIME,
    PRIMARY KEY (street_number, street_name, city, state, zipcode, acronym, start_time, end_time),
    FOREIGN KEY (street_number, street_name, city, state, zipcode, acronym)
        REFERENCES VotingCenter (street_number, street_name, city, state, zipcode, acronym)
        ON DELETE CASCADE,
	CHECK (start_time < end_time)
);

-- Create ElectionsStaff Table
-- CHAR for staff_id since it is a person_id
-- For the same reasons as operating_period, split schedule into 2 attributes: work_start_time and work_start_end
-- ON DELETE CASCADE since an ElectionsStaff must be a person, and an ElectionsStaff cannot work nowhere
-- Also make the address NOT NULL, also because every ElectionsStaff must work at a VotingCenter
-- CHECK if an ElectionsStaff that is scheduled to start working must be scheduled to stop working, thus
-- if work_start_time is not null, work_end_time cannot be null
CREATE TABLE IF NOT EXISTS ElectionsStaff (
    staff_id CHAR(16),
    street_number VARCHAR(10) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zipcode VARCHAR(9) NOT NULL,
    acronym VARCHAR(4) NOT NULL,
    work_start_time DATETIME,
    work_end_time DATETIME,
    PRIMARY KEY(staff_id),
    FOREIGN KEY (staff_id) REFERENCES Folks(person_id) ON DELETE CASCADE,
    FOREIGN KEY (street_number, street_name, city, state, zipcode, acronym)
        REFERENCES VotingCenter (street_number, street_name, city, state, zipcode, acronym)
        ON DELETE CASCADE,
	CHECK (work_start_time < work_end_time),
    CHECK (work_start_time IS NOT NULL AND work_end_time IS NOT NULL)
);

-- Create Clerk specialization
-- ON DELETE CASCADE, since a Clerk must exist as an ElectionsStaff
CREATE TABLE IF NOT EXISTS Clerk (
    clerk_id CHAR(16),
    PRIMARY KEY (clerk_id),
    FOREIGN KEY (clerk_id) REFERENCES ElectionsStaff (staff_id) ON DELETE CASCADE
);

-- Create Monitor specialization
-- ON DELETE CASCADE, since a Monitor must exist as an ElectionsStaff
CREATE TABLE IF NOT EXISTS Monitor (
    monitor_id CHAR(16),
    PRIMARY KEY (monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES ElectionsStaff (staff_id) ON DELETE CASCADE
);

-- Create Ballots Table
-- CHAR for ballot_id since it is a unique 4 character alphanumeric string
-- Split availability_period into 2 attributes: availability_time_start, availability_time_end
-- availability_period must be NOT NULL since a ballot must be available
-- question_text can be NULL, and uses an ENUM because there are only 3 choices 
CREATE TABLE IF NOT EXISTS Ballots (
    ballot_id CHAR(4),
    question_text ENUM('YES', 'NO', 'ABSTAIN'),
    availability_time_start DATETIME NOT NULL,
    availability_time_end DATETIME NOT NULL,
    PRIMARY KEY (ballot_id, question_text),
    CHECK (availability_time_start < availability_time_end)
);

-- Create offered_at Table
-- ON DELETE CASCADE, since existing Ballots must be offered at existing VotingCenters
CREATE TABLE IF NOT EXISTS offered_at (
    ballot_id CHAR(4),
    question_text ENUM('YES','NO','ABSTAIN'),
    acronym CHAR(4),
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    PRIMARY KEY (ballot_id, question_text, street_number, street_name, city, state, zipcode, acronym),
    FOREIGN KEY (ballot_id, question_text) REFERENCES Ballots (ballot_id, question_text) ON DELETE CASCADE,
    FOREIGN KEY (street_number, street_name, city, state, zipcode, acronym)
        REFERENCES VotingCenter (street_number, street_name, city, state, zipcode, acronym)
        ON DELETE CASCADE
);

-- Create VotingRegistry Table
-- date NOT NULL, needs to register on a date
-- ON DELETE CASCADE, since a person_id must refer to a real person, VotingCenter must exist, and
-- a VotingCenter must have a valid operating_period

CREATE TABLE IF NOT EXISTS VotingRegistry (
    registry_id CHAR(16),
    person_id CHAR(16),
    acronym CHAR(4),
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    acronym2 CHAR(4),
    street_number2 VARCHAR(10),
    street_name2 VARCHAR(100),
    city2 VARCHAR(100),
    state2 VARCHAR(500),
    zipcode2 VARCHAR(9),
    start_time DATETIME,
    end_time DATETIME,
    vote_time DATETIME NOT NULL,
    PRIMARY KEY (registry_id, person_id, street_number, street_name, city, state, zipcode, acronym),
    FOREIGN KEY (person_id) REFERENCES Folks(person_id) ON DELETE CASCADE,
    FOREIGN KEY (street_number, street_name, city, state, zipcode, acronym)
		REFERENCES VotingCenter (street_number, street_name, city, state, zipcode, acronym)
        ON DELETE CASCADE,
    FOREIGN KEY (street_number2, street_name2, city2, state2, zipcode2, acronym2, start_time, end_time)
        REFERENCES Center_times (street_number, street_name, city, state, zipcode, acronym, start_time, end_time)
        ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE (registry_id)
);

-- Create CastedVote Table
-- 
CREATE TABLE IF NOT EXISTS CastedVote (
    vote_id CHAR(16),
    registry_id CHAR(16),
    ballot_id CHAR(4),
    question_text ENUM('YES','NO','ABSTAIN'),
    choice ENUM('YES', 'NO', 'ABSTAIN'),
    cast_time DATETIME NOT NULL,
    acronym CHAR(4),
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    zipcode VARCHAR(9),
    PRIMARY KEY (vote_id),
    FOREIGN KEY (registry_id) REFERENCES VotingRegistry (registry_id) ON DELETE CASCADE,
    FOREIGN KEY (ballot_id, question_text) REFERENCES Ballots (ballot_id, question_text) ON DELETE CASCADE,
    FOREIGN KEY (street_number, street_name, city, state, zipcode, acronym)
        REFERENCES VotingCenter (street_number, street_name, city, state, zipcode, acronym)
        ON DELETE CASCADE
);

-- Trigger to ensure no overlapping operating times for a single VotingCenter in Center_times
DELIMITER //
CREATE TRIGGER no_overlap_center_times
BEFORE INSERT ON Center_times
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;
    SELECT COUNT(*) INTO overlap_count
    FROM Center_times
    WHERE NEW.street_number = street_number
      AND NEW.street_name = street_name
      AND NEW.city = city
      AND NEW.state = state
      AND NEW.zipcode = zipcode
      AND NEW.acronym = acronym
      AND (NEW.start_time BETWEEN start_time AND end_time
           OR NEW.end_time BETWEEN start_time AND end_time
           OR start_time BETWEEN NEW.start_time AND NEW.end_time);
    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No overlapping operating times for a single VotingCenter.';
    END IF;
END;
//
DELIMITER ;

-- Trigger to validate if a person’s date to register to vote in VotingRegistry 
-- falls within the operating periods of a VotingCenter
DELIMITER //
CREATE TRIGGER validate_register_period
BEFORE INSERT ON VotingRegistry
FOR EACH ROW
BEGIN
    DECLARE valid_period_count INT;
    SELECT COUNT(*) INTO valid_period_count
    FROM Center_times
    WHERE NEW.street_number = street_number
      AND NEW.street_name = street_name
      AND NEW.city = city
      AND NEW.state = state
      AND NEW.zipcode = zipcode
      AND NEW.acronym = acronym
      AND NEW.vote_time BETWEEN start_time AND end_time;
    IF valid_period_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registration date to vote in VotingRegistry does not fall within the operating periods of a VotingCenter';
    END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER validate_voting_period
BEFORE INSERT ON CastedVote
FOR EACH ROW
BEGIN
    DECLARE valid_ballot_count INT;

    -- Validate the cast time against ballot availability
    SELECT COUNT(*) INTO valid_ballot_count
    FROM Ballots
    WHERE NEW.ballot_id = ballot_id
      AND NEW.cast_time BETWEEN availability_time_start AND availability_time_end;

    -- If no valid ballot found, raise an error
    IF valid_ballot_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cast time does not align with ballot availability or voting center hours.';
    END IF;
END;
//

DELIMITER ;


-- Trigger to prevent changes to VotingCenter periods if it invalidates already casted votes
DELIMITER //
CREATE TRIGGER prevent_invalid_period_change
BEFORE UPDATE ON Center_times
FOR EACH ROW
BEGIN
    DECLARE invalid_vote_count INT;
    SELECT COUNT(*) INTO invalid_vote_count
    FROM CastedVote
    WHERE OLD.street_number = street_number
      AND OLD.street_name = street_name
      AND OLD.city = city
      AND OLD.state = state
      AND OLD.zipcode = zipcode
      AND OLD.acronym = acronym
      AND cast_time NOT BETWEEN NEW.start_time AND NEW.end_time;
    IF invalid_vote_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot change operating period, suggested time invalidates casted vote(s).';
    END IF;
END;
//
DELIMITER ;

-- Trigger to prevent modifications to Ballots with existing casted votes
DELIMITER //
CREATE TRIGGER prevent_ballot_modification
BEFORE UPDATE ON Ballots
FOR EACH ROW
BEGIN
    DECLARE vote_count INT;
    SELECT COUNT(*) INTO vote_count
    FROM CastedVote
    WHERE OLD.ballot_id = ballot_id
      AND OLD.question_text = question_text;
    IF vote_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot modify a Ballot with casted votes.';
    END IF;
END;
//
DELIMITER ;

-- Trigger to ensure a person can cast only one vote per ballot
-- “A folk can cast at most one vote for any single ballot. 
-- Attempts to vote more than once or without a currently valid registration are rejected.”
DELIMITER //
CREATE TRIGGER one_vote_per_ballot
BEFORE INSERT ON CastedVote
FOR EACH ROW
BEGIN
    DECLARE vote_count INT;
    SELECT COUNT(*) INTO vote_count
    FROM CastedVote
    WHERE NEW.registry_id = registry_id
      AND NEW.ballot_id = ballot_id
      AND NEW.question_text = question_text;
    IF vote_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A person can cast only one vote per Ballot.';
    END IF;
END;
//
DELIMITER ;
