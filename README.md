# Automated Clinical Annotation of FAERS Adverse Event Reports with LLMs

This project demonstrates an end-to-end workflow for automating the clinical annotation and triage of FDA Adverse Event Reporting System (FAERS) data using large language models (LLMs). The pipeline parses raw FAERS text files, generates concise clinical summaries and severity classifications for each event, and enables downstream analytics in SQL and Power BI.

---

## Overview

Pharmacovigilance teams spend enormous effort reviewing adverse event (AE) reports for meaningful insights. This project leverages LLMs to enrich FAERS data with instant, human-readable summaries and AI-generated severity levels—accelerating triage and unlocking new analytics.

- **Input:** Raw FAERS ASCII/TXT files (public FDA safety data)
- **Processing:** Automated parsing, cleaning, and row-wise LLM annotation via OpenAI API
- **Output:** Usable CSV with both raw and AI-enriched columns
- **Visualization:** Power BI dashboards for exploratory analysis and reporting

---

## Features

- **Automated LLM Annotation:**  
  Each adverse event is enriched with:
  - `AI_SUMMARY`: One-line clinical explanation of the event.
  - `AI_SEVERITY`: Severity level (Mild, Moderate, Severe, Death).

- **Turnkey Data Pipeline:**  
  Notebook and scripts handle everything: parsing, cleaning, batching, API calls, error handling, and output.

- **Ready for Analytics:**  
  Output CSV powers dynamic Power BI dashboards for interactive data exploration.

---

## Repo Structure

<pre> ## Repo Structure ``` faers-llm-clinical-annotation/ ├── README.md ├── requirements.txt ├── notebook/ │ └── faers_llm_annotation.ipynb ├── sql/ │ ├── 01_load_faers_demo.sql │ ├── 02_load_faers_reac.sql │ └── 03_featureset_creation.sql ├── data/ │ ├── DEMO24Q4.txt │ ├── REAC24Q4.txt │ ├── faers_parsed.csv │ └── faers_annotated.csv ├── dashboards/ │ ├── faers_powerbi_template.pbit │ └── faers_powerbi_report.pdf └── LICENSE ``` </pre>

> **Note:** Only include public, de-identified data—FAERS is open/public data.

---

## Example Workflow

1. **Data Extraction & Preparation**  
   - Download FAERS ASCII files (from [FDA’s website](https://fis.fda.gov/extensions/FPD-QDE-FAERS/FPD-QDE-FAERS.html)).
   - Convert to delimited `.csv` using Excel, Python, or any text editor.
   - Place files in the `data/` folder.

2. **Snowflake SQL (optional)**  
   - Use scripts in `sql/` to load, clean, and join raw tables in your Snowflake instance.
   - Output: Single table or CSV for annotation.

3. **LLM Annotation (Python Notebook)**  
   - Open `notebook/faers_llm_annotation.ipynb`.
   - Parses the CSV (even if all data is in a single column).
   - For each row:  
     - Generates a concise clinical summary (`AI_SUMMARY`)
     - Assigns a severity class (`AI_SEVERITY`)
   - Output: Annotated CSV for further analysis.

4. **Visualization in Power BI**  
   - Load the output CSV into Power BI.
   - Use template in `dashboards/faers_powerbi_template.pbit` for quick start.
   - Explore by event type, severity, sex, and more.

---

## Technical Stack

- **Python (Jupyter)**
  - pandas, openai, tqdm, etc.
- **SQL (Snowflake)**
- **Power BI Desktop** (.pbit, .pbix, .pdf)
- **LLM Provider:** OpenAI GPT-4 (API, v1+)

---

## Example AI Annotation

| primaryid | caseid | pt                      | AI_SUMMARY                                               | AI_SEVERITY         |
|-----------|--------|------------------------|----------------------------------------------------------|---------------------|
| 100100247 |10010024| Malignant melanoma I    | Summary: The adverse event reported is stage I melanoma. |                     |
| 100373859 |10037385| Insomnia                | Summary: The patient experienced difficulty sleeping.     |                     |
| 100373859 |10037385| Endometrial cancer      | Summary: Endometrial cancer was reported.                 | Classification: Severe |

---

## FAQ

**Q: What if my raw CSV is all in one column?**  
A: The notebook parses `$`-delimited or pipe-delimited single-column data, extracting each field automatically.

**Q: Does the LLM assign severity automatically?**  
A: Yes. The prompt instructs the model to classify severity based on clinical language, with categories: Mild, Moderate, Severe, Death.

**Q: Is this a replacement for human review?**  
A: No. LLM-generated annotations are for rapid triage and analytics, not final clinical or regulatory decision-making.

**Q: How does this integrate with BI tools?**  
A: The final annotated CSV is ready for direct upload to Power BI, Tableau, or any analytics tool.

---

## License

This project is provided for educational and portfolio purposes only. No patient identifiers are present; FAERS is a public dataset.

---

## Contact

Project by Aryaz Zomorodi  
[GitHub: AryazRez](https://github.com/AryazRez)  
For questions or collaboration, reach out via GitHub.

