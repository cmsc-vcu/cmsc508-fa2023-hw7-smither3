# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '(deafult description)',
    tag varchar(255) NOT NULL,
    url varchar(255),
    time_commitment int,
    primary key (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, name, description, tag, time_commitment) values 
    (1, 'taylor swift knowledge', 'can recognize any taylor swift song in one second', 'Skill 1', 1000000),
    (2, 'cat mom', 'has 2 cats', 'Skill 2', 999999),
    (3, 'taylor swift trivia','can answer trivia about taylor swift with 98% accuracy', 'Skill 3', 9999),
    (4, 'wordle', 'has solved wordle 500 days in a row', 'Skill 4', 10),
    (5, 'crossword', 'oddly good at crossword puzzles', 'Skill 5', 8),
    (6, 'watching tv', 'can watch an entire tv series in one sitting', 'Skill 6', 24), 
    (7, 'database theory', 'successfully completes their 508 assignments', 'Skill 7', 200),
    (8, 'SQL', 'thinks SQL is fun', 'Skill 8', 100);
    

select * from skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int,
    first_name varchar(256),
    last_name varchar(256) NOT NULL,
    email varchar(256), 
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined date NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people(id, first_name, last_name, email, discord_handle, brief_bio, date_joined) values 
    (1, 'Taylor', 'Person 1', 'theantihero13@gmail.com', 'taylorswift', 'perfection', '1989-12-13'),
    (2, 'Travis', 'Person 2', 'killatrav@gmail.com','ilovefootball87', 'football and taylor swifts boyfriend', '2023-09-26'),
    (3, 'Emma', 'Person 3', 'catluvr@icloud.com','swiftie4life', 'makes taylor swift her personality', '2023-03-25'),
    (4, 'Elise', 'Person 4', 'elisep@yahoo.com','wordle_legend', 'plays wordle daily', '2021-6-19'),
    (5, 'Addison', 'Person 5', 'iloveNYT@gmail.com','NYT_biggest_fan', 'plays new york crossword, wordle, and connections at midnight', '2020-08-03'),
    (6, 'Caroline', 'Person 6', 'carolinecheese@verizon.net', 'macNcheeseluvr', 'solely eats mac n cheese', '2023-02-16'),
    (7, 'Polly', 'Person 7', 'lovefrogs@icloud.com','greenfr0gz', 'amazing chef and mom', '2023-02-06'),
    (8, 'Thomas', 'Person 8', 'raidernation75@yahoo.com','raiderfootball', 'loyal raider fan for life', '2020-12-17'),
    (9, 'Stone', 'Person 9', 'meowmeow1@cat.com','cutestcatever', 'cat son of emma', '2019-04-26'),
    (10, 'Granite', 'Person 10', 'meowmeow1@cat.com','secondcutestcatever', 'other cat son of emma (but she picks favorites)', '2019-04-26');

SELECT * from people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired)
# None of the fields can ba NULL. ID can be auto_increment.

create table peopleskills (
    id int auto_increment primary key,
    skills_id int,
    people_id int,
    date_acquired date default '2023-11-10', 
    foreign key (skills_id) references skills(id),
    foreign key (people_id) references people(id),
    unique (skills_id, people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id) values 
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

select * from peopleskills;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles (
    id int,
    name varchar(256),
    sort_priority int,
    primary key (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(id, name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    id int auto_increment primary key,
    people_id int,
    role_id int,
    date_assigned date default '2023-11-10', 
    foreign key (people_id) references people(id),
    foreign key (role_id) references roles(id),
    unique (people_id, role_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id) values
    (1, 2),
    (2, 5),
    (2, 6),
    (3, 2),
    (3, 4),
    (4, 3),
    (5, 3),
    (6, 2),
    (6, 1),
    (7, 1),
    (8, 1),
    (8, 4),
    (9, 2),
    (10, 1),
    (10, 2);

SELECT * from peopleskills;

SELECT
    id,
    name
FROM
    roles 
WHERE
    id NOT IN (SELECT DISTINCT role_id FROM peopleroles)
ORDER BY
    id
;

