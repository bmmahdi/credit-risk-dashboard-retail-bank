# Process Maps — Credit Risk Assessment

This document describes the **AS-IS** (current, manual) and **TO-BE** (data-driven) loan approval processes for the retail bank, using Mermaid flowcharts with one swimlane (`subgraph`) per actor. A gap analysis table follows.

## AS-IS Process (current manual approval)

```mermaid
flowchart TD
    subgraph Applicant
        A1[Submit loan application]
        A2[Provide documents]
    end
    subgraph LoanOfficer[Loan Officer]
        L1[Collect documents]
        L2[Judgement-based review]
        L3[Approve / Decline]
        L4[Communicate decision]
    end
    subgraph CreditAnalyst[Credit Analyst]
        C1[Ad-hoc spreadsheet check]
        C2[Manual data entry]
    end
    subgraph Compliance[Compliance]
        K1[Post-hoc audit sample]
        K2[Log findings]
    end
    A1 --> A2 --> L1 --> L2 --> C1 --> C2 --> L3 --> L4 --> A2
    L3 --> K1 --> K2
```

## TO-BE Process (data-driven risk segmentation)

```mermaid
flowchart TD
    subgraph Applicant
        A1[Submit loan application]
        A2[Receive decision]
    end
    subgraph System[Risk Engine]
        S1[Load & clean data]
        S2[Compute 0-100 risk score]
        S3[Assign risk band]
        S4[Apply approval policy score < 60]
    end
    subgraph LoanOfficer[Loan Officer]
        L1[Review auto-decision]
        L2[Override with justification]
        L3[Communicate decision]
    end
    subgraph CreditAnalyst[Credit Analyst]
        C1[Monitor dashboard]
        C2[Recalibrate score quarterly]
    end
    subgraph Compliance[Compliance]
        K1[Audit score methodology]
        K2[Fairness review]
    end
    A1 --> S1 --> S2 --> S3 --> S4 --> L1 --> L2 --> L3 --> A2
    S4 --> C1 --> C2 --> S2
    L2 --> K1 --> K2
```

## Gap Analysis

| Area | AS-IS | TO-BE | Gap | Action |
|---|---|---|---|---|
| Decision basis | Judgement | Transparent 0–100 score | No standard score | Deploy risk score |
| Consistency | Officer-dependent | Rule-based policy | Inconsistent approvals | Approval policy (score < 60) |
| Risk visibility | Ad-hoc spreadsheets | Dashboard | No portfolio view | Build dashboard |
| Auditability | Sample audit | Documented methodology | Limited traceability | BRD + notebook |
| Monitoring | None | Quarterly recalibration | No feedback loop | Monitoring process |
| Fairness | Informal | Formal review | No structured check | Compliance review |
| Data quality | Manual entry | Automated cleaning | Error-prone | Validation steps |
| Speed | Manual review | Auto-decision + review | Slow turnaround | Risk engine |
