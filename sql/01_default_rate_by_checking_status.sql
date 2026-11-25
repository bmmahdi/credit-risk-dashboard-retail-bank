-- Business question: How does the default rate vary by the applicant's checking account status?
-- Checking status is a strong proxy for liquidity and is a key input to the risk score.
SELECT
    CheckingStatus,
    COUNT(*)                                              AS applicants,
    SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END)        AS defaults,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LoanAmount), 0)                             AS avg_loan_amount
FROM credit_risk
GROUP BY CheckingStatus
ORDER BY default_rate_pct DESC;
