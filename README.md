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

- The overall default rate is 33.52% with an approval rate of 67.56%.
- Applicants without a checking account have a default rate of 56.65%, compared to 9.3% for those with a negative balance.
- Loan purposes such as 'other' (64.6%), 'repairs' (56.54%), and 'appliances' (51.16%) show the highest default rates.
- Risk score bands strongly predict default: Very High (80-100) has 82.61% default rate, while Very Low (0-19) has 16.9%.
- The current approval policy (approve all) results in 1670 expected defaults; approving only risk score <60 reduces defaults to 737 (21.79% default rate).
- Portfolio at risk is highest for 'repairs' (68.71%) and 'other' (69.12%) segments.

**Recommendations**
- Implement a risk-based approval policy that rejects applicants with risk scores of 60 or higher to reduce expected defaults from 1670 to 737.
- Tighten approval criteria for high-risk loan purposes such as 'other', 'repairs', and 'appliances', and for applicants without a checking account.
- Monitor and manage portfolio at risk, particularly for segments with PAR above 60%, such as 'repairs' and 'other'.

<details><summary>🇫🇷 Résumé en français</summary>

Ce projet analyse les données des demandeurs de prêt pour segmenter par profil de risque et réduire les taux de défaut. Les principales conclusions montrent que le statut du compte courant, le motif du prêt et les bandes de score de risque sont de forts prédicteurs de défaut, et qu'une modification de la politique d'approbation peut réduire considérablement les défauts.

- Le taux de défaut global est de 33,52% avec un taux d'approbation de 67,56%.
- Les demandeurs sans compte courant ont un taux de défaut de 56,65%, contre 9,3% pour ceux avec un solde négatif.
- Les motifs de prêt tels que 'autre' (64,6%), 'réparations' (56,54%) et 'électroménager' (51,16%) présentent les taux de défaut les plus élevés.
- Les bandes de score de risque prédisent fortement le défaut : Très élevé (80-100) a 82,61% de défaut, tandis que Très faible (0-19) a 16,9%.
- La politique d'approbation actuelle (approuver tout) entraîne 1670 défauts attendus ; approuver uniquement un score de risque <60 réduit les défauts à 737 (taux de défaut de 21,79%).
- Le portefeuille à risque est le plus élevé pour les segments 'réparations' (68,71%) et 'autre' (69,12%).

</details>

## Dashboard

📊 **Interactive dashboard:** https://bmmahdi.github.io/credit-risk-dashboard-retail-bank/

## Skills demonstrated

SQL · Python (pandas, numpy, matplotlib) · Data cleaning & ETL · Risk scoring & segmentation · Policy simulation · Excel modelling · Data visualisation · Business intelligence · Stakeholder management · Documentation (BRD, user stories, process maps)

**Mohamed El Mahdi Benchouikh** · [Portfolio](https://bmmahdi.github.io/)
