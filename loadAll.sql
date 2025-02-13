-- Insert into Places
INSERT INTO Places (street_number, street_name, city, state, zipcode, coordinates, location_type)
VALUES
('101', 'One St', 'City1', 'State1', '11111', '10.0,20.0', 'residence'),
('102', 'Two St', 'City1', 'State1', '11112', '15.0,25.0', 'residence'),
('201', 'Three St', 'City2', 'State2', '22221', '30.0,40.0', 'residence'),
('301', 'Five St', 'City1', 'State1', '11113', '50.0,60.0', 'voting_center'),
('302', 'Six St', 'City2', 'State2', '22223', '70.0,80.0', 'voting_center'),
('401', 'Seven St', 'City3', 'State3', '33331', '90.0,100.0', 'voting_center');

-- Insert into Folks
INSERT INTO Folks (person_id, first_name, last_name, nickname, date_of_birth, primary_phone, secondary_phone,
    residence_street_number, residence_street_name, residence_city, residence_state, residence_zipcode)
VALUES
('0000000000000001', 'Person_first_name1', 'Person_last_name1', 'Nickname1', '1990-01-01', '1234567890', '0987654321', '101', 'One St', 'City1', 'State1', '11111'),
('0000000000000002', 'Person_first_name2', 'Person_last_name2', 'Nickname2', '1991-02-02', '1234567891', '0987654322', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000003', 'Person_first_name3', 'Person_last_name3', 'Nickname3', '1992-03-03', '1234567892', '0987654323', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000004', 'Person_first_name4', 'Person_last_name4', 'Nickname4', '1993-04-04', '1234567893', '0987654324', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000005', 'Person_first_name5', 'Person_last_name5', 'Nickname5', '1994-05-05', '1234567894', '0987654325', '101', 'One St', 'City1', 'State1', '11111'),
('0000000000000006', 'Person_first_name6', 'Person_last_name6', 'Nickname6', '1995-06-06', '1234567895', '0987654326', '101', 'One St', 'City1', 'State1', '11111'),
('0000000000000007', 'Person_first_name7', 'Person_last_name7', 'Nickname7', '1996-07-07', '1234567896', '0987654327', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000008', 'Person_first_name8', 'Person_last_name8', 'Nickname8', '1997-08-08', '1234567897', '0987654328', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000009', 'Person_first_name9', 'Person_last_name9', 'Nickname9', '1998-09-09', '1234567898', '0987654329', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000010', 'Person_first_name10', 'Person_last_name10', 'Nickname10', '1999-10-10', '1234567899', '0987654330', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000011', 'Person_first_name11', 'Person_last_name11', 'Nickname11', '2000-11-11', '1234567888', '0987654331', '101', 'One St', 'City1', 'State1', '11111'),
('0000000000000012', 'Person_first_name12', 'Person_last_name12', 'Nickname12', '2001-12-12', '1234567777', '0987654332', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000013', 'Person_first_name13', 'Person_last_name13', 'Nickname13', '1990-02-02', '1234567800', '0987654301', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000014', 'Person_first_name14', 'Person_last_name14', 'Nickname14', '1991-03-03', '1234567801', '0987654302', '201', 'Three St', 'City2', 'State2', '22221'),
('0000000000000015', 'Person_first_name15', 'Person_last_name15', 'Nickname15', '1992-04-04', '1234567802', '0987654303', '301', 'Five St', 'City1', 'State1', '11113'),
('0000000000000016', 'Person_first_name16', 'Person_last_name16', 'Nickname16', '1993-05-05', '1234567803', '0987654304', '302', 'Six St', 'City2', 'State2', '22223'),
('0000000000000017', 'Person_first_name17', 'Person_last_name17', 'Nickname17', '1994-06-06', '1234567804', '0987654305', '401', 'Seven St', 'City3', 'State3', '33331'),
('0000000000000018', 'Person_first_name18', 'Person_last_name18', 'Nickname18', '1995-07-07', '1234567805', '0987654306', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000019', 'Person_first_name19', 'Person_last_name19', 'Nickname19', '1996-08-08', '1234567806', '0987654307', '301', 'Five St', 'City1', 'State1', '11113'),
('0000000000000020', 'Person_first_name20', 'Person_last_name20', 'Nickname20', '1997-09-09', '1234567807', '0987654308', '302', 'Six St', 'City2', 'State2', '22223'),
('0000000000000021', 'Person_first_name21', 'Person_last_name21', 'Nickname21', '1998-10-10', '1234567808', '0987654309', '401', 'Seven St', 'City3', 'State3', '33331'),
('0000000000000022', 'Person_first_name22', 'Person_last_name22', 'Nickname22', '1999-11-11', '1234567809', '0987654310', '101', 'One St', 'City1', 'State1', '11111'),
('0000000000000023', 'Person_first_name23', 'Person_last_name23', 'Nickname23', '2000-12-12', '1234567810', '0987654311', '102', 'Two St', 'City1', 'State1', '11112'),
('0000000000000024', 'Person_first_name24', 'Person_last_name24', 'Nickname24', '2001-01-01', '1234567811', '0987654312', '201', 'Three St', 'City2', 'State2', '22221');

-- Insert into VotingCenter
INSERT INTO VotingCenter (street_number, street_name, city, state, zipcode, acronym) VALUES
('301', 'Five St', 'City1', 'State1', '11113', 'VC01'),
('302', 'Six St', 'City2', 'State2', '22223', 'VC02'),
('401', 'Seven St', 'City3', 'State3', '33331', 'VC03');

-- Insert into Center_times, 4 operating periods for each voting center, across 2 different months
INSERT INTO Center_times (street_number, street_name, city, state, zipcode, acronym, start_time, end_time) VALUES
-- November operating periods for VC1
('301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-11-01 00:00:00', '2024-11-04 16:00:00'),
('301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-11-05 00:00:00', '2024-11-08 16:00:00'),
-- December operating periods for VC1
('301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-12-01 00:00:00', '2024-12-04 16:00:00'),
('301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-12-05 00:00:00', '2024-12-08 16:00:00'),
-- November operating periods for VC2
('302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-11-01 00:00:00', '2024-11-04 17:00:00'),
('302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-11-05 00:00:00', '2024-11-08 17:00:00'),
-- December operating periods for VC2
('302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-12-01 09:00:00', '2024-12-01 17:00:00'),
('302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-12-02 09:00:00', '2024-12-02 17:00:00'),
-- November operating periods for VC3
('401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-11-01 00:00:00', '2024-11-04 18:00:00'),
('401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-11-05 10:00:00', '2024-11-08 18:00:00'),
-- December operating periods for VC3
('401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-12-01 10:00:00', '2024-12-01 18:00:00'),
('401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-12-02 10:00:00', '2024-12-02 18:00:00');

-- Insert 6 staff members into ElectionsStaff
INSERT INTO ElectionsStaff (staff_id, street_number, street_name, city, state, zipcode, acronym, work_start_time, work_end_time)
VALUES
-- Staff at VC01
('0000000000000015', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-11-01 08:00:00', '2024-11-01 16:00:00'),
('0000000000000019', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '2024-11-02 08:00:00', '2024-11-02 16:00:00'),
-- Staff at VC02
('0000000000000020', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-11-01 09:00:00', '2024-11-01 17:00:00'),
('0000000000000016', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '2024-11-02 09:00:00', '2024-11-02 17:00:00'),
-- Staff at VC03
('0000000000000021', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-11-01 10:00:00', '2024-11-01 18:00:00'),
('0000000000000017', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '2024-11-02 10:00:00', '2024-11-02 18:00:00');

-- Insert into Ballots
INSERT INTO Ballots (ballot_id, question_text, availability_time_start, availability_time_end) VALUES
-- Ballot B001
('B001', 'YES', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B001', 'NO', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B001', 'ABSTAIN', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
-- Ballot B002
('B002', 'YES', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B002', 'NO', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B002', 'ABSTAIN', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
-- Ballot B003
('B003', 'YES', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B003', 'NO', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B003', 'ABSTAIN', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
-- Ballot B004
('B004', 'YES', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B004', 'NO', '2024-11-01 00:00:00', '2024-11-04 23:59:59'),
('B004', 'ABSTAIN', '2024-11-01 00:00:00', '2024-11-04 23:59:59');

-- Insert into VotingRegistry, distributed among 3 ballots, 3 centers, and 2 months
-- Insert 24 Registrations into VotingRegistry
INSERT INTO VotingRegistry 
    (registry_id, person_id, acronym, street_number, street_name, city, state, zipcode, acronym2, street_number2, street_name2, city2, state2, zipcode2, start_time, end_time, vote_time)
VALUES
-- November registrations
('R001', '0000000000000001', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-11-01 00:00:00', '2024-11-04 16:00:00', '2024-11-01 09:00:00'),
('R002', '0000000000000002', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-11-01 00:00:00', '2024-11-04 17:00:00', '2024-11-01 10:00:00'),
('R003', '0000000000000003', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-11-01 00:00:00', '2024-11-04 18:00:00', '2024-11-01 11:00:00'),
-- December registrations
('R004', '0000000000000004', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-12-01 00:00:00', '2024-12-04 16:00:00', '2024-12-01 09:00:00'),
('R005', '0000000000000005', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-12-01 09:00:00', '2024-12-01 17:00:00', '2024-12-01 10:00:00'),
('R006', '0000000000000006', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-12-01 10:00:00', '2024-12-01 18:00:00', '2024-12-01 11:00:00'),
-- Additional Voting Registrations
('R007', '0000000000000007', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-11-01 00:00:00', '2024-11-04 16:00:00', '2024-11-02 09:00:00'),
('R008', '0000000000000008', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-11-01 00:00:00', '2024-11-04 17:00:00', '2024-11-02 10:00:00'),
('R009', '0000000000000009', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-11-01 00:00:00', '2024-11-04 18:00:00', '2024-11-02 11:00:00'),
('R010', '0000000000000010', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-12-01 00:00:00', '2024-12-04 16:00:00', '2024-12-02 09:00:00'),
('R011', '0000000000000011', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-12-01 09:00:00', '2024-12-01 17:00:00', '2024-12-02 10:00:00'),
('R012', '0000000000000012', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-12-02 10:00:00', '2024-12-02 18:00:00', '2024-12-02 11:00:00'),
('R013', '0000000000000013', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-11-01 00:00:00', '2024-11-04 16:00:00', '2024-11-01 12:00:00'),
('R014', '0000000000000014', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-11-01 00:00:00', '2024-11-04 17:00:00', '2024-11-01 13:00:00'),
('R015', '0000000000000015', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-11-01 00:00:00', '2024-11-04 18:00:00', '2024-11-01 14:00:00'),
('R016', '0000000000000016', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-12-01 00:00:00', '2024-12-04 16:00:00', '2024-12-01 12:00:00'),
('R017', '0000000000000017', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-12-01 09:00:00', '2024-12-01 17:00:00', '2024-12-01 13:00:00'),
('R018', '0000000000000018', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-12-01 10:00:00', '2024-12-01 18:00:00', '2024-12-01 14:00:00'),
('R019', '0000000000000019', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-11-01 00:00:00', '2024-11-04 16:00:00', '2024-11-02 15:00:00'),
('R020', '0000000000000020', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-11-01 00:00:00', '2024-11-04 17:00:00', '2024-11-02 16:00:00'),
('R021', '0000000000000021', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-11-01 00:00:00', '2024-11-04 18:00:00', '2024-11-02 17:00:00'),
('R022', '0000000000000022', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', 'VC01', '301', 'Five St', 'City1', 'State1', '11113', '2024-12-01 00:00:00', '2024-12-04 16:00:00', '2024-12-02 15:00:00'),
('R023', '0000000000000023', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', 'VC02', '302', 'Six St', 'City2', 'State2', '22223', '2024-12-02 09:00:00', '2024-12-02 17:00:00', '2024-12-02 16:00:00'),
('R024', '0000000000000024', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331', '2024-12-02 10:00:00', '2024-12-02 18:00:00', '2024-12-02 17:00:00');

-- Insert 18 Casted Votes
INSERT INTO CastedVote (vote_id, registry_id, ballot_id, choice, cast_time, acronym, street_number, street_name, city, state, zipcode)
VALUES
-- Votes for Ballot B001
('V001', 'R001', 'B001', 'YES', '2024-11-01 09:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V002', 'R002', 'B001', 'NO', '2024-11-01 10:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V003', 'R003', 'B001', 'ABSTAIN', '2024-11-01 11:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('V004', 'R004', 'B001', 'YES', '2024-11-02 09:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V005', 'R005', 'B001', 'NO', '2024-11-02 10:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V006', 'R006', 'B001', 'ABSTAIN', '2024-11-01 11:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('V007', 'R007', 'B001', 'YES', '2024-11-02 09:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V008', 'R008', 'B001', 'NO', '2024-11-02 10:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V009', 'R009', 'B001', 'ABSTAIN', '2024-11-02 11:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
-- Votes for Ballot B002
('V010', 'R010', 'B002', 'YES', '2024-11-02 09:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V011', 'R011', 'B002', 'NO', '2024-11-01 10:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V012', 'R012', 'B002', 'ABSTAIN', '2024-11-01 12:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('V013', 'R013', 'B002', 'YES', '2024-11-01 12:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V014', 'R014', 'B002', 'NO', '2024-11-01 13:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V015', 'R015', 'B002', 'ABSTAIN', '2024-11-01 14:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('V016', 'R016', 'B002', 'YES', '2024-11-01 12:00:00', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('V017', 'R017', 'B002', 'NO', '2024-11-01 13:00:00', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('V018', 'R018', 'B002', 'ABSTAIN', '2024-11-01 14:00:00', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331');

INSERT INTO offered_at (ballot_id, question_text, acronym, street_number, street_name, city, state, zipcode) VALUES
-- Ballot B001 offered at all voting centers
('B001', 'YES', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B001', 'YES', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B001', 'YES', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('B001', 'NO', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B001', 'NO', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B001', 'NO', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('B001', 'ABSTAIN', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B001', 'ABSTAIN', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B001', 'ABSTAIN', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
-- Ballot B002 offered at all voting centers
('B002', 'YES', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B002', 'YES', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B002', 'YES', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('B002', 'NO', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B002', 'NO', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B002', 'NO', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331'),
('B002', 'ABSTAIN', 'VC01', '301', 'Five St', 'City1', 'State1', '11113'),
('B002', 'ABSTAIN', 'VC02', '302', 'Six St', 'City2', 'State2', '22223'),
('B002', 'ABSTAIN', 'VC03', '401', 'Seven St', 'City3', 'State3', '33331');

