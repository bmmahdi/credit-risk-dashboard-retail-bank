# Credit Risk Assessment Dashboard for a Retail Bank

[![Analysis](https://github.com/bmmahdi/credit-risk-dashboard-retail-bank/actions/workflows/analysis.yml/badge.svg)](https://github.com/bmmahdi/credit-risk-dashboard-retail-bank/actions/workflows/analysis.yml) ![Python](https://img.shields.io/badge/Python-pandas-1f4e79?style=flat-square) ![SQL](https://img.shields.io/badge/SQL-SQLite-1f4e79?style=flat-square) ![Business Analysis](https://img.shields.io/badge/Business-Analysis-1f4e79?style=flat-square)

## Business problem

A Canadian retail bank approves consumer loans using inconsistent, judgement-based decisions with limited portfolio-level visibility. Defaults erode margin and increase capital requirements. This project answers: **How can we segment loan applicants by risk profile to reduce default rates and optimize approval decisions?**

## Dataset

- **Source:** IBM credit risk dataset (public extract of the German Credit data), distributed by IBM for analytics education. See the IBM Sample Data Sets documentation.
- **File:** `data/credit_risk.csv` — 5,000 rows, 20 attributes (checking status, loan duration, credit history, purpose, amount, savings, employment, installment %, demographics, housing, job, risk label).
- **Licence note:** Public dataset used for educational/portfolio purposes. No personal or confidential data. Loan amounts are in dataset currency units and used for relative exposure only.

## Approach

1. **SQL preparation** (`sql/01–05`): default rate by checking status, by purpose, risk score distribution, approval policy simulation, portfolio at risk.
2. **Python analysis** (`notebooks/analysis.py`): cleaning, transparent 0–100 risk score from five weighted drivers, five risk bands, policy simulation, charts and JSON exports.
3. **Dashboard** (`docs/index.html`): reads `docs/dashboard.json` and `docs/data/*.json`.
4. **Excel model** (`excel_model.json`): inputs, scoring weights, policy simulation and summary with live formulas.
5. **Documentation**: BRD, user stories, process maps (AS-IS / TO-BE), stakeholder slides.

## Repository structure

```
credit-risk-dashboard-retail-bank/
├── data/credit_risk.csv
├── sql/01_default_rate_by_checking_status.sql
├── sql/02_default_rate_by_purpose.sql
├── sql/03_risk_score_distribution.sql
├── sql/04_approval_policy_simulation.sql
├── sql/05_portfolio_at_risk_by_segment.sql
├── notebooks/analysis.py
├── scripts/run_sql.py
├── scripts/check_outputs.py
├── outputs/charts/*.png
├── outputs/summary.json
├── docs/index.html
├── docs/dashboard.json
├── docs/data/*.json
├── docs/BRD.md
├── docs/user_stories.md
├── docs/process_map.md
├── excel_model.json
├── slides.json
└── README.md
```

## How to run

```bash
pip install -r requirements.txt
python scripts/run_sql.py          # runs sql/*.sql -> outputs/sql/*.csv
python notebooks/analysis.py       # charts, summary.json, docs/data/*.json
python scripts/check_outputs.py    # validates outputs
```

Open `docs/index.html` in a browser to view the dashboard.

## Key findings

_The analysis runs automatically with GitHub Actions; findings appear here when it finishes._

## Dashboard

📊 Dashboard: published with the project.

## Skills demonstrated

SQL · Python (pandas, numpy, matplotlib) · Data cleaning & ETL · Risk scoring & segmentation · Policy simulation · Excel modelling · Data visualisation · Business intelligence · Stakeholder management · Documentation (BRD, user stories, process maps)

**Mohamed El Mahdi Benchouikh** · [Portfolio](https://bmmahdi.github.io/)
