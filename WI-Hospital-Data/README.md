
# 🏥 Wisconsin Hospital Quality Analysis

<img width="1440" alt="Dashboard Screenshot" src="https://github.com/user-attachments/assets/7ff68781-110a-432c-a773-f9b9b040714c" />

### [View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/WI_Hospital_Data_Tableau/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## 📄 Project Overview
**Goal:** To analyze CMS provider data and evaluate the performance of Wisconsin hospitals across three critical metrics: **Safety, Mortality, and Readmission**.

## 🛠️ Tech Stack & Workflow
* **Python (Pandas):**
    * Ingested raw CMS data (`Hospital_General_Information.csv`).
    * **Data Cleaning:** Filtered for WI region, removed "Not Available" strings in key metric columns to enable numeric conversion, and filled null values for "Birthing Friendly" designation.
    * **Feature Engineering:** Calculated custom "Net Scores" for Safety, Mortality, and Readmission to normalize performance metrics (Measures Better - Measures Worse).
* **Python (Geopy):**
    * Used the Geopy library to programmatically retrieve Latitude/Longitude coordinates for hospital addresses from the OpenStreetMap API so that the hospital locations could be properly visualized on a map.
    * **Data Quality:** Manually filled in 4 missing coordinate pairs using Google Maps data.
* **Tableau:**
    * **Visualization:** Mapped spatial distribution of hospital ratings.
    * **Interactivity:** Created a dynamic **Dashboard Action** where clicking a summary bar updates the detailed ranking chart.
    * **Parameters:** Implemented a "Select Metric" parameter allowing users to toggle the ranking chart between Safety, Mortality, and Readmission views.

## 📊 Key Visualizations
1.  **Geospatial Analysis:** A map of WI hospitals, color-coded by "Overall Rating" (Red-Green gradient) to identify quality clusters.
2.  **Dynamic Ranking (Lollipop Chart):** A user-selectable ranking of all hospitals based on the active metric (Safety/Mortality/Readmission).
3.  **Correlation Scatter Plot:** Plots *Readmission* vs. *Safety*, sized by location density to reveal patterns between safety protocols and patient return rates.
4.  **Statewide Performance:** A summary bar chart highlighting that Wisconsin maintains **above-average Safety scores**, despite having negligible differences in Mortality/Readmission scores.

## 📂 Project Structure
* `WI_Hospital_Data.ipynb`: Python notebook for cleaning, score calculation, and geocoding.
* `WI_Hospital_Data.csv`: The final, clean dataset used for visualization.
* `WI_Hospital_Data_Tableau.twbx`: The Tableau packaged workbook.

---
*Created by Gabriel Espinoza*
