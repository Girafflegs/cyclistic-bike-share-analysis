# Cyclistic Bike-Share Analysis

## Project Overview

Cyclistic is a fictional Chicago-based bike-share company seeking to increase annual memberships. This independent case study examines how casual riders and annual members use bike-share services differently, with the goal of identifying behavioral patterns that may inform future membership conversion strategies.

The analysis uses 12 months of publicly available Divvy bike-share trip data, covering October 2025 through September 2026.

The findings suggest that casual riders use the service more frequently for recreational purposes, while annual members exhibit patterns more consistent with routine commuting.

## View the Case Study

[View the complete Cyclistic case study presentation](LINK_TO_PRESENTATION)

## Repository Contents

### SQL
- **Investigation:** Queries used to explore data quality, investigate anomalies, and examine ridership patterns.
- **Preparation and Cleaning:** Scripts used to combine monthly datasets, identify and remove duplicates, and prepare the data for analysis.
- **Validation:** Queries used to verify the integrity of the cleaned dataset.

### Python
- **cyclistic_monthly_validation_portfolio.ipynb:** Jupyter notebook containing the automated monthly data-validation workflow.
- **validation_summary.csv:** Consolidated results of validation checks performed across all 12 monthly datasets.

## Reproducing the Python Validation Workflow

The original Divvy trip datasets are not included in this repository.

To reproduce the validation workflow:

1. Download the monthly datasets for October 2025 through September 2026 from the [Divvy Trip Data archive](https://divvy-tripdata.s3.amazonaws.com/index.html).
2. Extract the 12 CSV files into a folder named `Cyclistic_data_raw`.
3. Place `Cyclistic_data_raw` alongside the folder containing the Python notebook, as shown below:

    Cyclistic_capstone/
    ├── Cyclistic_data_raw/
    │   └── [12 monthly CSV files]
    └── Cyclistic_python/
        └── cyclistic_monthly_validation_portfolio.ipynb

4. Open the notebook in Jupyter Notebook with Python and pandas installed.
5. Run the notebook cells in order to generate the monthly validation summary.

The notebook uses the relative path `../Cyclistic_data_raw` to locate the original CSV files.

## Generative AI Use Disclosure

Generative AI was used throughout this project as a learning and technical support tool, including assistance with Python development, SQL troubleshooting, Tableau workflows, and presentation development.

The author directed the analytical process, verified results, and made the final decisions regarding methodology, findings, and recommendations.
