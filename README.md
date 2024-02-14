# Data Processing & Importing by PLSQL

This PL/SQL script is designed to process employee data from a temporary table and insert it into permanent tables. It performs the following tasks:

1. Validates employee emails.
2. Checks and inserts job titles into the `JOBS` table if not already present.
3. Checks and inserts city locations into the `LOCATIONS` table if not already present.
4. Checks and inserts department names into the `DEPARTMENTS` table if not already present.
5. Inserts employee data into the `EMPLOYEES` table.
   
## Usage Notes

- Ensure that the necessary exceptions are handled appropriately for cases where data is not found or invalid.
- Customize data validation and insertion logic as per specific business requirements.
- Review and optimize the script for performance if dealing with large datasets.

## License

This PL/SQL script is provided under the [MIT License](LICENSE).

