-- transaction.sql not to be run in workbench, this is from the Jupyter client and is meant to be run in the cell for activity 4
print("A.4 Voter Casting a Ballot")
import mysql.connector
from mysql.connector import Error

def cast_vote(connection):
    print("A.4 Voter Casting a Ballot")

    # Get user input
    person_id = input("Enter your Person ID: ")
    ballot_id = input("Enter the Ballot ID: ")
    vote_choice = input("Enter your vote (YES, NO, ABSTAIN): ")
    vote_time = input("Enter the vote time (YYYY-MM-DD HH:MM:SS): ")

    try:
        # Start a transaction
        connection.start_transaction()
        cursor = connection.cursor()

        # Step 1: Validate registration
        query_validate = """
        SELECT registry_id 
        FROM VotingRegistry
        WHERE person_id = %s 
          AND vote_time <= %s;
        """
        cursor.execute(query_validate, (person_id, vote_time))
        registration = cursor.fetchone()

        if not registration:
            raise Exception("Invalid registration: No valid registration found for this person and vote time.")

        registry_id = registration[0]

        # Step 2: Check for duplicate vote
        query_duplicate_check = """
        SELECT COUNT(*)
        FROM CastedVote
        WHERE registry_id = %s
          AND ballot_id = %s;
        """
        cursor.execute(query_duplicate_check, (registry_id, ballot_id))
        duplicate_count = cursor.fetchone()[0]

        if duplicate_count > 0:
            raise Exception("Duplicate vote detected: A person can cast only one vote per ballot.")

        # Step 3: Cast the vote
        query_cast_vote = """
        INSERT INTO CastedVote (vote_id, registry_id, ballot_id, choice, cast_time)
        VALUES (UUID(), %s, %s, %s, %s);
        """
        cursor.execute(query_cast_vote, (registry_id, ballot_id, vote_choice, vote_time))

        # Commit the transaction if everything is successful
        connection.commit()
        print("Vote successfully cast!")

    except Exception as e:
        # Rollback in case of error
        connection.rollback()
        print(f"Failed to cast vote: {e}")
    finally:
        if cursor:
            cursor.close()

print("7. 0000000000000001, B001, ABSTAIN, 2024-11-01 09:00:01")
cast_vote(db_connection)