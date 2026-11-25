# User Stories — Credit Risk Assessment Dashboard

## US-01 — View portfolio default rate (Must)
**As a** Chief Risk Officer **I want** to see the current default rate and portfolio at risk **so that** I can assess the health of the loan book.

```gherkin
Given the cleaned credit risk dataset
When I open the dashboard
Then I see the default rate and portfolio at risk as KPI cards
And the values match outputs/summary.json
```

## US-02 — Segment applicants by risk band (Must)
**As a** Credit Analyst **I want** applicants segmented into five risk bands **so that** I can prioritise review effort.

```gherkin
Given each applicant has a risk score between 0 and 100
When the score is computed
Then the applicant is assigned to one of five risk bands
And the default rate increases monotonically across bands
```

## US-03 — Understand default drivers (Must)
**As a** Loan Approval Manager **I want** to see default rate by checking status and purpose **so that** I can apply tighter rules where risk is highest.

```gherkin
Given the dataset grouped by checking status
When I view the drivers chart
Then I see the default rate for each checking status
And the highest-risk category is clearly identifiable
```

## US-04 — Simulate an approval policy (Must)
**As a** Chief Risk Officer **I want** to simulate an approval cut-off **so that** I can quantify defaults avoided versus approvals lost.

```gherkin
Given a cut-off of risk score < 60
When the policy simulation runs
Then I see the approval rate and residual default rate
And the number of defaults avoided versus approving all
```

## US-05 — Monitor portfolio at risk by product (Should)
**As a** Credit Analyst **I want** portfolio at risk by loan purpose **so that** I can flag high-exposure products.

```gherkin
Given defaulted applicants
When I group exposure by loan purpose
Then I see exposure at risk and PAR % per purpose
And purposes are sorted by exposure at risk
```

## US-06 — Transparent scoring methodology (Must)
**As a** Compliance Officer **I want** the scoring methodology documented **so that** decisions are auditable.

```gherkin
Given the risk score uses five weighted drivers
When I read the BRD and notebook
Then each driver and weight is documented
And protected attributes are excluded from the score
```

## US-07 — Export dashboard data (Should)
**As a** Data Engineer **I want** dashboard data exported as JSON **so that** the dashboard can render without a database.

```gherkin
Given the analysis has run
When I inspect docs/data
Then each chart has a JSON file of records
And every file referenced in dashboard.json exists
```

## US-08 — Excel business model (Should)
**As a** Finance Analyst **I want** an Excel model with inputs and formulas **so that** I can test alternative cut-offs.

```gherkin
Given the Excel model
When I change the cut-off input
Then the summary sheet recalculates approval and default rates
```

## US-09 — Review risk score distribution (Could)
**As a** Loan Approval Manager **I want** to see the distribution of applicants across risk bands **so that** I understand capacity needs.

```gherkin
Given applicants assigned to risk bands
When I view the distribution chart
Then I see the count of applicants per band
```

## US-10 — Compare policies (Could)
**As a** Chief Risk Officer **I want** to compare current vs proposed policy **so that** I can justify the change.

```gherkin
Given two policies
When the simulation runs
Then I see approval rate and default rate side by side
```

## US-11 — Data quality report (Should)
**As a** Credit Analyst **I want** a record of rows removed during cleaning **so that** I trust the analysis.

```gherkin
Given the raw dataset
When cleaning runs
Then the number of removed rows is printed
And impossible values are excluded
```

## US-12 — Stakeholder presentation (Could)
**As a** Project Lead **I want** a slide deck **so that** I can present findings to stakeholders.

```gherkin
Given the analysis is complete
When I open slides.json
Then I see 6-8 slides covering problem, data, method, findings, recommendations and next steps
```
