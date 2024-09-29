## Deliverable(s)

The group repository needs to include the following:
- `db-models.md` containing:
    - Conceptual Model
    - Logical Model
    - Physical Model
    - Description / Justification of presented models
- `docker-compose.yml` to build container environment
- `init_PROJECTNAME.sql` to build database per physical model
- `README.md` with documentation on starting and connecting to DB, and descriptions of SQL query scripts in `SQL-Toolbox`
- `SQL-Toolbox` folder with 5 SQL query scripts addressing common business queries

## Rubric

Score: # out of 24 points

Since there has been in class discussion time to build each model and agree to the foundations as a group, who commits the collection of models and other required elements will not be tracked.

In the `DB` folder:

- `db-models.md` contains:
    - Conceptual Model ( / 3)
        - visualization provided
        - description provided
        - is understandable by all parties (business to developers)
    - Logical Model ( / 4)
        - visualization provided
        - description provided
        - shows primary key & non-key attributes of entities
        - shows relationship between entities using foreign keys
    - Physical model ( / 4)
        - visualization provided
        - description provided
        - MariaDB specific
        - defines data types for attributes

- `docker-compose.yml` to builds container environment ( / 1)
- `init_PROJECTNAME.sql` to builds database per physical model ( / 5)
- `README.md` contains on how to ( / 2)
    - start the DB container
    - connect to the database / validate the database configuration
    - description of each SQL query scripts in `SQL-Toolbox`
- `SQL-Toolbox` folder with SQL query scripts addressing common business queries ( / 5)
