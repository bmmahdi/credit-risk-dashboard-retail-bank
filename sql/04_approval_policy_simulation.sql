-- Business question: What approval rate and residual default rate result from a
-- risk-band cut-off policy? Compares current (approve all) vs proposed policy.
SELECT
    'Approve all (current)'                               AS policy,
    COUNT(*)                                              AS approved,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit_risk), 2) AS approval_rate_pct,
    SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END)        AS expected_defaults,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk
UNION ALL
SELECT
    'Approve risk score < 60'                             AS policy,
    COUNT(*)                                              AS approved,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit_risk), 2) AS approval_rate_pct,
    SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END)        AS expected_defaults,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM (
    SELECT Risk,
        (CASE CheckingStatus
            WHEN 'no_checking' THEN 25 WHEN 'less_0' THEN 20
            WHEN '0_to_200' THEN 10 WHEN 'greater_200' THEN 0 ELSE 12 END)
      + (CASE CreditHistory
            WHEN 'no_credits' THEN 25 WHEN 'delayed' THEN 20
            WHEN 'critical' THEN 20 WHEN 'prior_payments_delayed' THEN 12
            WHEN 'credits_paid_to_date' THEN 0 ELSE 10 END)
      + (CASE WHEN LoanDuration > 36 THEN 20 WHEN LoanDuration > 24 THEN 12 WHEN LoanDuration > 12 THEN 5 ELSE 0 END)
      + (CASE WHEN InstallmentPercent >= 4 THEN 15 WHEN InstallmentPercent = 3 THEN 8 ELSE 0 END)
      + (CASE ExistingSavings
            WHEN 'less_100' THEN 15 WHEN 'unknown' THEN 12 WHEN '100_to_500' THEN 8
            WHEN '500_to_1000' THEN 4 ELSE 0 END)         AS risk_score
    FROM credit_risk
)
WHERE risk_score < 60;
