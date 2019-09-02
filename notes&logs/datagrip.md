#Data Grip Notes:

## Glossary:

DDL: Data Definition Language File: A file that deals with database
queries involved in table management, checking, and maintenance 
operations. Can create, modify or remove database objects (including
users and indicies). Data Exploration statements are not included. 

Data Source: Connection to a database or file or DDL file.

Schema: Informally: a blueprint to define how to construct a database
or table. Formally: A set of formulas (integrity constraints) imposed
on a database, that rigorously defines the tables and relations between 
them (?).

Integrity Constraint: Rules programmed into the database. Some Types:

- Entity Integrity: concerns primary keys, every table must have
a primary key (unique and not null)

- Referential Integrity: concerns foreign keys - which can be in only
two states: (1) Foreign key refers to the primary key of another table, 
or (2) ?

- Domain Integrity: all columns must be declared on a domain.

- Domain: A pool of values, or (like) a set with unique entities 
inside. They are all of the same type, by definition (integer, blob, etc)

- User-defined Integrity: rules concerning users.


### Creating a Database Connection:

Simply click on the new database connection tab, and fill out the
form.


### Adding a table:

Right click on the Left Database Area of the screen. import a csv
file and follow the dialogue to configure the table header. 

Your table will appear in database > username > schema > public.
It can be accessed and viewed from here.

Once this is done, you can drag and drop from the Files area (on
the right), straight onto the schema > public area. This can be
done quickly for all files.

### Seeing underlying scripts:

For each table generated, you can see the underlying
sql by right-clicking on the table, and selecting
"Generate DDL to X". X is choice of output.

This can be done at any level of the database, including
the root database table itself. Scripts to generate 
the child tables below will also be included in the DDL.



### Integrating SQL Scripts into Project:

Simply open your project folder in the Files Area (right 
hand side), and place scripts in it.


##Questions:

- When the DDL script is run, how do you indicate
the file path to csv or other files?






