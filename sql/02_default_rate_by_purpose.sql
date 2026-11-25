-- Business question: Which loan purposes carry the highest default rate and exposure?
-- Used to prioritise underwriting rules and pricing by product.
SELECT
    LoanPurpose,
    COUNT(*)                                              AS applicants,
    SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END)        AS defaults,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LoanAmount), 0)                             AS avg_loan_amount,
    SUM(LoanAmount)                                       AS total_exposure
FROM credit_risk
GROUP BY LoanPurpose
ORDER BY default_rate_pct DESC;
