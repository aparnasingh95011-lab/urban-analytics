# UrbanStay Analytics – Group Submission

## Project summary

**UrbanStay Analytics** is a full-stack data analytics system that analyses Airbnb-style market data using MySQL, Python (Pandas), a Flask REST API, and a Streamlit dashboard with a Bank-Maintain style UI.

---

## What each group must upload (course expectations)

Your group submission should include all of the following:

| # | Requirement | What to include |
|---|-------------|-----------------|
| 1 | **Weekly individual contributions** | Each member’s weekly log of tasks (see *As one group member* below). |
| 2 | **Source code and outputs** | This repo (or zip) + **screenshots** (e.g. dashboard, API, database, run steps). |
| 3 | **Executable code without external dependencies** | Code that runs with `requirements.txt` and standard setup (MySQL can be Docker or local; see README). |
| 4 | **Updates to the e-journal logs** | E-journal entries for the project (as required by your course). |

---

## As one group member – what you need to submit

You don’t submit the whole project alone; the **group** uploads one package. Your job is to give your part to the group:

1. **Your weekly individual contributions**  
   A short document (e.g. Word/PDF) or section in the e-journal with:
   - Your name and student ID  
   - For each week: what you did (tasks, files you changed, decisions)  
   - Aligned with your role (see *Group work contributions* below)

2. **Your e-journal updates**  
   Whatever your course asks for in the e-journal (e.g. weekly logs, reflections). Make sure your entries are done and shared with the group so they can be included in the submission.

3. **Share with the group**  
   - If you’re the one packing the submission: use the *Deliverables checklist* and *Project structure* below and add everyone’s contribution docs and e-journal updates.  
   - If not: send your **weekly contributions** and **e-journal updates** to the teammate who is assembling the submission.

You do **not** need to duplicate the full source code or outputs yourself—that’s the group’s single upload. Your personal deliverables are: **weekly contributions** + **e-journal updates**.

---

## What to submit (group package)

- **Option A – Code repository (recommended)**  
  A zip of the project folder (or a Git repository link) that includes everything below.

- **Option B – Separate items**  
  If the course asks for separate uploads, use the same contents but split as requested (e.g. code zip, report PDF, etc.).

### 1. Deliverables checklist

| Item | Location / description |
|------|-------------------------|
| **Source code** | Entire `UrbanAnalytics` project folder (see *Project structure* below). |
| **Data** | `data/listings.csv`, `data/reviews.csv`, `data/calendar.csv` (or instructions to generate them in README). |
| **Database schema** | `db/schema.sql` (+ `scripts/run_schema.py` to apply it). |
| **Documentation** | `README.md` (setup & run), `DEMO.md` (demo steps), this `SUBMISSION.md`. |
| **Run instructions** | In `README.md`: Quick start, MySQL options, ETL, API, dashboard. |
| **Group contributions** | Table below in this file (and optionally in report). |
| **Screenshots / outputs** | E.g. folder `screenshots/` or `outputs/`: dashboard, API responses, DB, run steps. |
| **Weekly contributions** | One file per member or one doc with all (see *As one group member*). |
| **E-journal updates** | As required by the course; include in the same upload. |

**Executable without external dependencies:** The app runs with `pip install -r requirements.txt`, MySQL (Docker or local), and the steps in README. No other external APIs or services are required.

### 2. Project structure to include

```
UrbanAnalytics/
├── README.md              # Setup, run, API, dashboard
├── SUBMISSION.md          # This file – what to submit, contributions
├── DEMO.md                # Demo / presentation steps
├── config.py
├── requirements.txt
├── docker-compose.yml     # Optional MySQL
├── run.sh / run.bat       # One-command run (optional)
├── data/
│   ├── listings.csv
│   ├── reviews.csv
│   └── calendar.csv
├── db/
│   └── schema.sql
├── etl/
│   └── load_data.py
├── api/
│   └── app.py
├── dashboard/
│   ├── app.py
│   └── icons.py
└── scripts/
    ├── run_schema.py
    ├── fill_realistic_data.py
    └── generate_sample_data.py
```

You can exclude: `venv/`, `__pycache__/`, `.git/`, `*.pyc`, and backup files (e.g. `*.bak`) when zipping.

### 3. How to run (for markers)

1. `pip install -r requirements.txt`
2. Start MySQL (e.g. `docker-compose up -d` or use existing server; set `config.py` if needed).
3. `python scripts/run_schema.py`
4. `python etl/load_data.py`
5. `python api/app.py` (API at http://localhost:5000)
6. `streamlit run dashboard/app.py` (dashboard at http://localhost:8501)

See `README.md` and `DEMO.md` for full details.

---

## Group work contributions

| Name | Student ID | Role in project | Responsibilities | Contact |
|------|------------|-----------------|------------------|---------|
| Anusha Reddy Govind | CIM10841 | Data analysis & visualisation | Data exploration, dashboard visualisation, documentation | anusha@example.com |
| Aparna Singh | CIM10853 | Data processing & API development | Data cleaning, dataset integration, API development | aparna@example.com |
| Anil Gyawali | CIM11113 | Database design & integration | Database schema design, SQL queries, system integration | anil@example.com |
| Asharib Ali | CIM10619 | Backend development | Backend server setup, analytics processing, system architecture | asharib@example.com |

---

## File-level work distribution (who worked in which files)

Based on the roles above, this table shows **which files each member worked in** and **what type of work** they did there.

| Group member | File(s) | Type of work in that file |
|--------------|---------|----------------------------|
| **Anusha Reddy Govind** | `dashboard/app.py` | Dashboard layout, Streamlit UI, chart configs, navigation, Bank-Maintain style styling, insight pages and visualisations. |
| | `dashboard/icons.py` | Heroicons setup and SVG helpers for dashboard UI. |
| | `dashboard/__init__.py` | Package init for the dashboard module. |
| | `README.md` | Setup instructions, quick start, run steps, API and dashboard overview. |
| | `DEMO.md` | Demo/presentation steps for running and showing the project. |
| | `SUBMISSION.md` | Submission checklist, contributions table, what to upload. |
| **Aparna Singh** | `etl/load_data.py` | Data loading from CSV to MySQL, cleaning, type conversion, truncate/load logic, chunked reading for large files. |
| | `scripts/fill_realistic_data.py` | Data cleaning, filling missing reviewer/comments and prices, deduplication, realistic data generation. |
| | `scripts/generate_sample_data.py` | Synthetic dataset generation for testing (listings, reviews, calendar). |
| | `api/app.py` | Flask API: route definitions, analytics endpoints, SQL queries for each insight, request/response handling. |
| **Anil Gyawali** | `db/schema.sql` | Table definitions (listings, reviews, calendar), primary/foreign keys, indexes, data types. |
| | `scripts/run_schema.py` | DB creation, user setup, applying schema (executing schema.sql), connection handling. |
| | `config.py` | Database connection settings (host, user, password, database name) and API/dashboard config used by schema and ETL. |
| **Asharib Ali** | `api/app.py` | Flask app bootstrap, server setup, DB connection lifecycle, app configuration and structure. |
| | `config.py` | Central config (API URL, ports) and system-wide settings for backend and dashboard. |
| | `docker-compose.yml` | MySQL container definition and backend-related service setup for local run. |
| | `run.sh` / `run.bat` | One-command run scripts: start MySQL, schema, ETL, API, dashboard (system architecture). |
| | `requirements.txt` | Python dependencies for the whole project (backend and dashboard). |

**Shared files (more than one role):**

- **`api/app.py`** — Aparna: analytics routes and endpoint logic; Asharib: Flask app init and server setup.
- **`config.py`** — Anil: DB connection config used by schema/ETL; Asharib: general app/API/dashboard config.

---

## Suggested mapping to project components

- **Data analysis & visualisation:** Dashboard (`dashboard/`), charts, insights design, README/DEMO/SUBMISSION docs.
- **Data processing & API development:** ETL (`etl/load_data.py`), data cleaning scripts (`scripts/fill_realistic_data.py`), Flask API routes (`api/app.py`).
- **Database design & integration:** Schema (`db/schema.sql`), `scripts/run_schema.py`, DB-related config in `config.py`.
- **Backend development:** Flask server setup in `api/app.py`, config, Docker/run scripts, requirements, system architecture.

Use or adapt this mapping in your report if you need to describe who did what.

---

## Contact

For questions about this submission, use the contact details in the contributions table above.
