Overview
This application manages data for a voting system, including tables for places, people, voting centers, ballots, etc.
It utilizes MySQL as the DBMS.

Prereq
1. Install MySQL Server and MySQL workbench/client
2. Create a user/local instance of a MySQL server
3. Download zipped SQL scripts
4. Download Jupyter Notebook file

Steps to run database
1. Open createAll.sql and run to create the database 'wonderland' and all of the tables
2. Open loadAll.sql and run to populate the required data
4. Open queryAll.sql and run to execute queries 1-10.
5. Open Juptyer Notebook, load CMSC461 Project
6. Login and establish connection to database, make sure createAll.sql and loadAll.sql have been run
7. Execute activity cells, and query cells if not already ran queryAll.sql in workbench
8. Open dropAll.sql once finsihed to clean the database and delete 'wonderland'