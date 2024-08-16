# QUERY 1 
# Requirements: Involves multiple tables (Requirement A), Filtering (Requirement B), Aggregation (Requirement C).
-- Drop the existing view if it exists
DROP VIEW IF EXISTS View_Job_Postings_Salary_GBP;

-- Create the new view
CREATE VIEW View_Job_Postings_Salary_GBP AS
SELECT 
    jp.Job_id, 
    jp.Title, 
    s.salary_from, 
    s.salary_to, 
    s.salary_currency
FROM 
    `job posting` jp 
JOIN 
    `salary` s ON jp.Salary_id = s.Salary_id
WHERE 
    s.salary_currency = 'gbp'
GROUP BY 
    jp.Job_id, 
    jp.Title, 
    s.salary_from, 
    s.salary_to, 
    s.salary_currency;
    
    SELECT * FROM View_Job_Postings_Salary_GBP;


# QUERY 2
-- Requirements: Involves multiple tables (Requirement A), Filtering (Requirement B).
-- Drop the existing view if it exists
DROP VIEW IF EXISTS View_Skills_By_Experience_Level;

-- Create the new view
CREATE VIEW View_Skills_By_Experience_Level AS
SELECT 
    s.skill_name, 
    el.experence_level
FROM 
    `skills` s
JOIN 
    `skills and values` sav ON s.Skill_id = sav.Skills_Skill_id
JOIN 
    `job posting` jp ON sav.`Job posting_Job_id` = jp.Job_id
JOIN 
    `experience level` el ON jp.Experience_level_id = el.Experience_level_id
WHERE 
    el.experence_level = 'junior';

SELECT * FROM View_Skills_By_Experience_Level;

# QUERY 3
-- Requirements: Involves multiple tables (Requirement A), Filtering (Requirement B).
-- Drop the existing view if it exists
-- Drop the existing view if it exists
DROP VIEW IF EXISTS View_Jobs_Remote_Interview1;

-- Create the new view
CREATE VIEW View_Jobs_Remote_Interview1 AS
SELECT 
    jp.Job_id, 
    jp.Title, 
    l.city, 
    l.country_code
FROM 
    `job posting` jp
JOIN 
    `location` l ON jp.Location_id = l.Location_id
WHERE 
    jp.Remote_interview = 'TRUE';

-- Test QUERY 3
SELECT * FROM View_Jobs_Remote_Interview1;

# QUERY 4
-- Requirements: Involves multiple tables (Requirement A), Filtering (Requirement B), Subquery (Requirement E).
-- Drop the existing view if it exists
DROP VIEW IF EXISTS View_Skills_for_Job_Postings;

-- Create the new view
CREATE VIEW View_Skills_for_Job_Postings AS
SELECT 
    jp.Job_id, 
    jp.Title, 
    s.skill_name
FROM 
    `job posting` jp
JOIN 
    `skills and values` sav ON jp.Job_id = sav.`Job posting_Job_id`
JOIN 
    `skills` s ON sav.Skills_Skill_id = s.Skill_id
WHERE 
    jp.Job_id IN (
        SELECT Job_id 
        FROM `job posting` 
        WHERE Remote_interview = 'TRUE'
    );

-- Test QUERY 4
SELECT * FROM View_Skills_for_Job_Postings;

# QUERY 5
--  Requirments: Involves a linking table and both source tables (Requirement D), Aggregation (Requirement C).
DROP VIEW IF EXISTS View_Skills_And_Values;

CREATE VIEW View_Skills_And_Values AS
SELECT 
    s.skill_name, 
    sv.skill_value
FROM 
    `skills` s
JOIN 
    `skills and values` sav ON s.Skill_id = sav.Skills_Skill_id
JOIN 
    `skill value` sv ON s.Skill_value_id = sv.Skill_value_id;
    
    SELECT * FROM View_Skills_And_Values;

