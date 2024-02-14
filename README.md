# Data Processing & Importing by PLSQL

This PL/SQL script is designed to process employee data from a temporary table and insert it into permanent tables. 

## Features

- **Email Validation**: Ensures that employee emails are valid before insertion.
- **Dynamic tables Handling**: Automatically adds new job titles, city locations, and department names if not already present in their respective tables.
- **Efficient Data Processing**: Utilizes cursor-based iteration for processing employee records, ensuring efficient handling even with large datasets.

## Instructions

1. **Setup Database Environment**: Ensure that the necessary tables (`EMPLOYEES_TEMP`, `EMPLOYEES`, `JOBS`, `LOCATIONS`, `DEPARTMENTS`) are created in the database. You can use the provided SQL scripts to create these tables if they don't exist.
2. **Execute the Script**: Run the provided PL/SQL script in your Oracle database environment. This script iterates through the employee records in the temporary table `EMPLOYEES_TEMP`, processes the data, and inserts it into the respective permanent tables.
3. **Verify Data**: After running the script, verify the data in the permanent tables (`EMPLOYEES`, `JOBS`, `LOCATIONS`, `DEPARTMENTS`) to ensure that the employee records are correctly inserted.

