# College Placement Data Analysis — Daily Project Journal

**GitHub Repository:** https://github.com/Shrexya/College-Placement-Data-Analysis

**Dataset:** `college_student_placement_dataset.csv`

**Dataset size verified:** 10,000 rows × 10 columns

**Tools:** Python, Pandas, NumPy, Matplotlib, Jupyter Notebook, VS Code, Git, GitHub

---

# Day 1 — Data Inspection

## 1. Objective

The objective of Day 1 was to understand the dataset before performing any meaningful analysis. Before analyzing student placement patterns, I needed to understand the dataset's structure, column names, data types, and basic statistics.

## 2. Importing Libraries

### Code

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
```

### What I learned

- **Pandas (`pd`):** Used to load, manipulate, clean, group, and analyze tabular data.
- **NumPy (`np`):** Provides numerical operations and mathematical functionality.
- **Matplotlib (`plt`):** Used to create charts and visualizations.

These libraries provide the foundation for the project's data analysis.

## 3. Loading the Dataset

### Code

```python
df = pd.read_csv("../data/college_student_placement_dataset.csv")
df.head()
```

### What I learned

`pd.read_csv()` loads a CSV file into a Pandas DataFrame.

A **DataFrame** is a table containing rows and columns. Here, `df` is the variable storing the dataset.

The relative path `../data/college_student_placement_dataset.csv` tells Python to move one directory up from the notebook's folder and then enter the `data` folder.

`df.head()` displays the first five rows by default. This helps me verify that the file loaded and that the records look reasonable.

## 4. Inspecting the Dataset Structure

### Code

```python
df.info()
df.describe()
```

### What I learned

**`df.info()`**

Displays information about the DataFrame, including:
- Number of rows and columns.
- Column names.
- Non-null counts.
- Data types.
- Memory usage.

**`df.describe()`**

Provides descriptive statistics for numeric columns, including:
- `count`: Number of non-missing observations.
- `mean`: Average value.
- `std`: Standard deviation, which measures variation.
- `min`: Minimum value.
- `25%`, `50%`, `75%`: Quartiles; the 50th percentile is the median.
- `max`: Maximum value.

These functions help me understand the dataset without examining every record individually.

## 5. Checking Missing Values

### Code

```python
df.isnull().sum()
df = df.dropna()
```

### What I learned

`df.isnull()` identifies missing values and returns Boolean results: `True` for missing values and `False` otherwise.

`.sum()` counts the missing values in each column because Pandas counts `True` as 1.

`df.dropna()` removes rows containing missing values. Assigning its result back to `df` means the DataFrame now contains the resulting rows.

**Important:** In this notebook, `dropna()` was executed before the Day 2 missing-value check. Therefore, the later result of zero missing values describes the cleaned DataFrame; it does not independently establish how many missing values existed originally.

In future projects, I should record the original missing-value counts before removing rows and verify how many records were removed.

## 6. Checking Dataset Dimensions

### Code

```python
df.shape
```

### Output

```text
(10000, 10)
```

### Interpretation

- 10,000 rows.
- 10 columns.

The result is a tuple in the format `(number_of_rows, number_of_columns)`.

This confirmed the dimensions of the DataFrame at the time of the check.

## 7. Checking Column Names

### Code

```python
print(df.columns)
```

### What I learned

`df.columns` returns the names of all columns in the DataFrame.

The dataset contains these 10 columns:

1. `College_ID`
2. `IQ`
3. `Prev_Sem_Result`
4. `CGPA`
5. `Academic_Performance`
6. `Internship_Experience`
7. `Extra_Curricular_Score`
8. `Communication_Skills`
9. `Projects_Completed`
10. `Placement`

Understanding these columns is necessary before deciding which questions the dataset can answer.

For example, the dataset has no branch names, salary figures, or graduation years. Therefore, it cannot directly support branch-wise placement rates or salary trends.

## 8. Grouping Data and Calculating Averages

### A. Average CGPA by College ID

```python
df.groupby("College_ID")["CGPA"].mean()
```

**Explanation:**

- `groupby("College_ID")` groups records by college ID.
- `["CGPA"]` selects the CGPA column.
- `.mean()` calculates the average CGPA within each group.

This demonstrates how to calculate grouped statistics. It does not, by itself, establish a relationship between CGPA and placement.

### B. Average IQ by Internship Experience

```python
df.groupby("Internship_Experience")["IQ"].mean()
```

**Explanation:**

This groups students according to whether they have internship experience and calculates the average IQ for each group.

It demonstrates how to compare a numerical variable across categories. It does not establish causation or tell us whether internship experience improves placement outcomes.

## Day 1 — What I accomplished

- Imported the required Python libraries.
- Loaded the CSV dataset.
- Viewed the first five records.
- Inspected the DataFrame structure and descriptive statistics.
- Checked missing values and applied `dropna()`.
- Verified the DataFrame dimensions.
- Listed the dataset's column names.
- Practised `groupby()` and `mean()`.

**GitHub update:** Saved the notebook and pushed the project files through VS Code Source Control to the existing GitHub repository.

---

# Day 2 — Data Cleaning and Data Quality Checks

## 1. Objective

The objective of Day 2 was to check whether the dataset contained duplicate records, missing values, unexpected data types, inconsistent categories, or suspicious numerical values.

Data cleaning helps improve the reliability of later analysis. However, suspicious values should be investigated rather than automatically deleted or modified.

## 2. Checking Duplicate Rows

### Code

```python
df.duplicated().sum()
```

### Output

```text
0
```

### What I learned

`df.duplicated()` identifies rows that duplicate an earlier row across all columns. `.sum()` counts those duplicate rows.

The result was zero, meaning no complete duplicate rows were detected.

This check does not detect records that may represent the same student but differ in one or more columns.

**Decision:** No duplicate rows needed to be removed based on this check.

## 3. Checking Missing Values Again

### Code

```python
df.isnull().sum()
```

### Output

All 10 columns returned zero missing values.

### What I learned

This confirmed that the current DataFrame contained no remaining null values.

However, because `df.dropna()` had already been executed on Day 1, this was a post-cleaning check. To establish the original missing-value counts in a future review, I should reload the raw dataset separately and inspect it before dropping anything.

**Decision:** No additional missing-value removal was required at this stage.

## 4. Checking Data Types

### Code

```python
df.dtypes
```

### Observed data types

| Column | Data type |
|---|---|
| `College_ID` | String |
| `IQ` | Integer |
| `Prev_Sem_Result` | Float |
| `CGPA` | Float |
| `Academic_Performance` | Integer |
| `Internship_Experience` | String |
| `Extra_Curricular_Score` | Integer |
| `Communication_Skills` | Integer |
| `Projects_Completed` | Integer |
| `Placement` | String |

### What I learned

A data type determines how Python and Pandas interpret a value.

- **String:** Text or categorical values.
- **Integer:** Whole numbers.
- **Float:** Numbers that may contain decimal places.

The observed data types were appropriate for the displayed columns. For example, `College_ID` is an identifier rather than a numerical measurement, so it should not be averaged as if it represented a quantity.

No data-type conversions were needed based on this inspection.

## 5. Checking Placement Categories

### Code

```python
df["Placement"].value_counts()
```

### Output

| Placement | Number of students |
|---|---:|
| No | 8,341 |
| Yes | 1,659 |
| **Total** | **10,000** |

### What I learned

`df["Placement"]` selects the placement column.

`.value_counts()` counts the occurrences of each distinct value.

The dataset contains 8,341 records labelled `No` and 1,659 labelled `Yes`.

This confirms that the placement column contains the two expected categories. It also gives us the counts needed for the overall placement analysis planned for Day 3.

The placement rate will be calculated separately rather than inferred from the counts alone.

## 6. Checking Internship Categories

### Code

```python
df["Internship_Experience"].value_counts()
```

### Output

| Internship experience | Number of students |
|---|---:|
| No | 6,036 |
| Yes | 3,964 |
| **Total** | **10,000** |

### What I learned

This checks the number of records in each internship category.

The observed values were `Yes` and `No`, with no other category appearing in the output.

This is useful because inconsistent labels such as `yes`, `YES`, or `Y` could otherwise split the same category into separate groups during analysis.

**Decision:** No category standardization was required based on the observed values.

## 7. Checking the CGPA Range

### Code

```python
df["CGPA"].min(), df["CGPA"].max()
```

### Output

```text
(4.54, 10.46)
```

### What I learned

- `.min()` returns the smallest value.
- `.max()` returns the largest value.

The maximum CGPA was 10.46. Since CGPA is generally measured on a 10-point scale, values above 10 require investigation.

### Identifying values above 10

```python
df[df["CGPA"] > 10]
```

This filters the DataFrame and displays records where CGPA exceeds 10.

To count these records:

```python
(df["CGPA"] > 10).sum()
```

### Output

```text
249
```

There were 249 records with CGPA above 10.

### Checking for negative CGPA values

```python
(df["CGPA"] < 0).sum()
```

**Output:** `0`

### Interpretation and decision

The data contains 249 suspicious CGPA values above the usual 10-point maximum and no negative CGPA values.

I did not change or delete these records. The values should be documented as a data-quality concern until the dataset's documentation or original source clarifies whether they are errors.

Removing these records without investigation could introduce bias into the analysis.

## 8. Checking Academic Performance

### Code

```python
df["Academic_Performance"].min(), df["Academic_Performance"].max()
```

### Output

```text
(1, 10)
```

The observed values range from 1 to 10, which is consistent with a 1–10 scoring scale.

**Decision:** No suspicious minimum or maximum was identified in this check.

## 9. Checking Previous Semester Results

### Code

```python
df["Prev_Sem_Result"].min(), df["Prev_Sem_Result"].max()
```

### Output

```text
(5.0, 10.0)
```

The observed range was 5.0 to 10.0. These values are consistent with a 10-point scale for previous semester results.

**Decision:** No suspicious minimum or maximum was identified in this check.

## 10. Checking for Negative IQ Values

### Code

```python
(df["IQ"] < 0).sum()
```

### Output

```text
0
```

No negative IQ values were detected.

This only checks for negative values; it does not prove that every IQ value is realistic or correctly recorded.

---

# Day 2 — Final Results

The following checks were completed:

| Check | Result | Decision |
|---|---|---|
| Duplicate rows | 0 | No duplicate removal needed |
| Remaining missing values | 0 in all columns | No further removal needed |
| Data types | Appropriate for observed columns | No conversion needed |
| Placement categories | `Yes`, `No` | Consistent |
| Internship categories | `Yes`, `No` | Consistent |
| CGPA above 10 | 249 records | Flag for investigation |
| CGPA below 0 | 0 records | No issue detected |
| Academic performance | 1–10 | Within expected range |
| Previous semester result | 5–10 | Within expected range |
| Negative IQ values | 0 | No issue detected |

## What I accomplished

I used Pandas to check duplicate records, missing values, data types, categorical values, and numerical ranges. I also identified 249 potentially invalid CGPA values without altering the original values.

**Important distinction:** These checks do not prove that the entire dataset is error-free. They establish the specific quality checks performed and the issues identified.

---

