USE placement_analysis;

-- 1. Count of placed and non-placed students
SELECT Placement, COUNT(*) AS Student_Count
FROM college_student_placement_dataset
GROUP BY Placement;


-- 2. Overall placement percentage
SELECT
    Placement,
    COUNT(*) AS Student_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM college_student_placement_dataset),
        2
    ) AS Percentage
FROM college_student_placement_dataset
GROUP BY Placement;


-- 3. Average CGPA by placement status
SELECT
    Placement,
    ROUND(AVG(CGPA), 2) AS Average_CGPA
FROM college_student_placement_dataset
GROUP BY Placement;


-- 4. Placement rate by internship experience
SELECT
    Internship_Experience,
    COUNT(*) AS Total_Students,
    SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS Placed_Students,
    ROUND(
        SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Placement_Rate
FROM college_student_placement_dataset
GROUP BY Internship_Experience;


-- 5. Placement rate by number of completed projects
SELECT
    Projects_Completed,
    COUNT(*) AS Total_Students,
    SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS Placed_Students,
    ROUND(
        SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Placement_Rate
FROM college_student_placement_dataset
GROUP BY Projects_Completed
ORDER BY Projects_Completed;


-- 6. Average communication skills by placement status
SELECT
    Placement,
    ROUND(AVG(Communication_Skills), 2) AS Average_Communication_Skills
FROM college_student_placement_dataset
GROUP BY Placement;
