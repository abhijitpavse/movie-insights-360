# IMDb Movie Dataset Cleaning & Exploratory Data Analysis (EDA)

This project performs data cleaning, data quality assessment, statistical analysis, and visual exploration on an IMDb dataset containing **9,999 raw records** of movies and TV shows using Python (`pandas`, `numpy`, and `matplotlib`).

---

## 📌 Project Overview

The objective of this analysis is to transform raw, unstructured movie dataset columns into clean, analysis-ready formats and extract insights regarding movie ratings, release trends, and genre popularity.

Key steps in the notebook include:
- **Data Quality Assessment**: Identifying missing values across columns and reporting missing percentages.
- **Deduplication**: Detecting and removing **431 duplicate records** (reducing row count from 9,999 to 9,568).
- **Data Transformation**:
  - Extracting 4-digit numeric years (`Release_Year`) from formatted text strings.
  - Converting vote counts (`VOTES`) into clean numerical data.
  - Handling multi-label genre strings using string splitting and array explosion.
- **Descriptive Statistics**: Summarizing key metrics (Count, Mean, Median, Min, Max) for `RATING`, `VOTES`, `RunTime`, and `Release_Year`.
- **Insights & Data Visualizations**:
  1. Top-rated and most popular movies/shows.
  2. Categorical distribution of titles across major genres.
  3. Historical release trends over time.
  4. Average rating comparisons by genre.

---

## 🛠️ Tools & Libraries Used

* **Python 3.x**
* **Pandas**: Data manipulation and cleaning
* **NumPy**: Numerical operations
* **Matplotlib**: Data visualization

---

## 📊 Key Findings

* **Most Frequent Genre**: Drama (~4,115 titles) followed by Comedy (~2,736 titles) and Action (~2,110 titles).
* **Highest Average Ratings**: Animation and History categories consistently achieve higher average viewer ratings ($> 7.3$).
* **Release Trends**: Peak content output occurred around 2019–2020.

---

## 🚀 How to Run

1. Clone the repository:
   ```bash
   git clone [https://github.com/your-username/imdb-data-analysis.git](https://github.com/your-username/imdb-data-analysis.git)
   cd imdb-data-analysis
