# Business Requirements Document — Credit Risk Assessment Dashboard

**Project:** Credit Risk Assessment Dashboard for a Retail Bank
**Market:** Canada
**Version:** 1.0
**Status:** Approved for build

## 1. Context

The retail bank originates consumer loans (car, furniture, education, business, etc.) across Canada. Loan approval decisions are currently made by loan officers using inconsistent judgement, with limited visibility into portfolio-level risk. Defaults erode margin and increase capital requirements under OSFI guidelines. The bank wants a data-driven, transparent risk segmentation to standardise approvals and reduce default rates.

## 2. Objectives

- Quantify the current default rate and portfolio at risk.
- Identify the key drivers of default (checking status, credit history, loan duration, installment burden, savings).
- Build a transparent 0–100 risk score and segment applicants into five risk bands.
- Simulate an approval policy and quantify the trade-off between approval rate and residual default rate.
- Deliver a dashboard for the Chief Risk Officer and loan approval managers.

## 3. Scope

**In scope**
- Analysis of the IBM credit risk dataset (5,000 historical applicants).
- SQL data preparation, risk scoring, and policy simulation.
- Dashboard (risk distribution, drivers, policy simulation, portfolio at risk).
- Excel business model with inputs, scoring formulas and summary.

**Out of scope**
- Real-time integration with the core banking system.
- Machine-learning model deployment (a rules-based score is used for transparency).
- Regulatory capital modelling (Basel/OSFI AIRB).
- Credit bureau data enrichment.

## 4. Stakeholders

| Stakeholder | Role | Interest |
|---|---|---|
| Chief Risk Officer | Sponsor | Portfolio risk, default reduction |
| Loan Approval Managers | Primary users | Clear approval rules |
| Credit Analysts | Data users | Score transparency, drivers |
| Compliance Team | Governance | Fairness, auditability, documentation |

## 5. Business Requirements

- **BR-01** The bank shall measure the current default rate and portfolio at risk across the loan book.
- **BR-02** The bank shall segment applicants into five risk bands using a transparent, auditable score.
- **BR-03** The bank shall identify the top drivers of default to inform underwriting rules.
- **BR-04** The bank shall simulate approval policies and quantify the approval-rate / default-rate trade-off.
- **BR-05** The bank shall provide a dashboard for monitoring risk distribution and portfolio at risk.
- **BR-06** The bank shall document the scoring methodology for compliance review.

## 6. Functional Requirements

- **FR-01** The system shall load and clean the credit risk dataset (deduplicate, validate age/amount/duration).
- **FR-02** The system shall compute a 0–100 risk score from five weighted drivers.
- **FR-03** The system shall assign each applicant to a risk band (Very Low to Very High).
- **FR-04** The system shall compute default rate, approval rate, average loan amount and portfolio at risk.
- **FR-05** The system shall simulate an approval cut-off (risk score < 60) and report defaults avoided.
- **FR-06** The system shall export dashboard data as JSON records.
- **FR-07** The system shall produce charts for risk band, purpose, checking status, policy and PAR.
- **FR-08** The system shall provide an Excel model with inputs, formulas and a summary sheet.

## 7. KPIs

| KPI | Definition | Target |
|---|---|---|
| Default rate | Share of applicants flagged Risk | Reduce vs baseline |
| Approval rate | Share approved under policy | ≥ 65% |
| Average loan amount | Mean loan amount | Monitor |
| Risk score distribution | Applicants per risk band | Monotonic default rate |
| Portfolio at risk | Exposure of defaulted applicants / total exposure | Reduce vs baseline |

## 8. Assumptions

- The historical dataset is representative of the current applicant population.
- The rules-based score is an acceptable proxy for a statistical model at this stage.
- Loan amounts are in the dataset's currency units and used for relative exposure only.

## 9. Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Score overfits historical patterns | Medium | Monitor, recalibrate quarterly |
| Fairness concerns (sex, age, foreign worker) | High | Exclude protected attributes from score; compliance review |
| Data quality issues | Medium | Cleaning and validation steps |
| Policy too strict reduces revenue | Medium | Simulate multiple cut-offs |
