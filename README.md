# College Placement Data Analysis

## Overview

A data analysis project that explores student placement outcomes and identifies factors associated with successful placements using Python, Pandas, Matplotlib, and MySQL.

The project involves data inspection, cleaning, exploratory analysis, visualization, and SQL-based analysis to understand patterns in student placement data.

## Objectives

- Calculate the overall student placement rate.
- Compare CGPA and previous semester results across placement groups.
- Examine placement patterns based on internship experience.
- Analyse the relationship between completed projects and placement outcomes.
- Explore communication skills, academic performance, and IQ in relation to placements.
- Create visualizations to communicate important findings.
- Perform SQL queries to analyse placement data stored in a MySQL database.

## Dataset

The dataset contains 10,000 student records and 10 columns:

- College_ID
- IQ
- Prev_Sem_Result
- CGPA
- Academic_Performance
- Internship_Experience
- Extra_Curricular_Score
- Communication_Skills
- Projects_Completed
- Placement

## Technologies Used

- **Python** — Data analysis and processing
- **Pandas** — Data manipulation, grouping, and aggregation
- **NumPy** — Numerical operations
- **Matplotlib** — Data visualization
- **MySQL** — Database querying and analysis
- **MySQL Workbench** — SQL execution and database management

## Analysis Performed

### 1. Data Inspection and Cleaning
- Inspected dataset structure, columns, and data types.
- Checked missing values and duplicate records.
- Examined numerical ranges and categorical distributions.
- Identified suspicious CGPA values for further attention.

### 2. Exploratory Data Analysis
- Calculated overall placement rates.
- Compared average CGPA and previous semester results by placement status.
- Examined placement rates based on internship experience.
- Analysed placement outcomes based on completed projects.
- Compared communication skills, IQ, and other academic factors across placement groups.

### 3. Data Visualization
Created charts to represent:
- Overall placement distribution.
- Placement percentage distribution.
- Average CGPA by placement status.
- Placement rates by internship experience.
- Placement rates by number of completed projects.
- Average communication skills by placement status.

### 4. SQL Analysis
Imported the dataset into MySQL and performed queries using:
- SELECT and WHERE
- COUNT(), SUM(), and AVG()
- GROUP BY and ORDER BY
- CASE WHEN
- ROUND() and subqueries

## Key Findings

- The overall placement rate was **16.59%**.
- Students who were placed had a higher average CGPA (8.59) than those who were not placed (7.32).
- Students with 2–5 completed projects had placement rates of approximately 22–24%, compared with approximately 2–3% for students with 0–1 projects.
- Placed students had a higher average communication skills score (7.66) than non-placed students (5.14).
- Students with and without internship experience had similar placement rates.
- Academic performance scores did not show a clear increasing relationship with placement rates in this dataset.

## Project Structure

```text
College-Placement-Data-Analysis/
│
├── Data/
│   └── college_student_placement_dataset.csv
│
├── Notebook/
│   └── placement_analysis.ipynb
│
├── SQL/
│   └── queries.sql
│
├── PROJECT_JOURNAL.md
└── README.md
```

## Conclusion

This project demonstrates how Python, Pandas, Matplotlib, and SQL can be used together to inspect, analyse, and visualize student placement data.

The analysis identified differences in placement outcomes across CGPA, communication skills, and completed projects, while also highlighting that internship experience alone did not show a substantial difference in placement rates.

The findings represent associations within the available dataset and do not establish cause-and-effect relationships.

## Project Status

**Completed** — Data inspection, cleaning checks, exploratory analysis, visualizations, and SQL analysis.