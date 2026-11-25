-- Business question: Where is the portfolio at risk concentrated?
-- Portfolio at risk (PAR) = exposure of applicants flagged as Risk.
SELECT
    LoanPurpose,
    COUNT(*)                                              AS applicants,
    SUM(CASE WHEN Risk = 'Risk' THEN LoanAmount ELSE 0 END) AS exposure_at_risk,
    SUM(LoanAmount)                                       AS total_exposure,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN LoanAmount ELSE 0 END) / SUM(LoanAmount), 2) AS par_pct
FROM credit_risk
GROUP BY LoanPurpose
ORDER BY exposure_at_risk DESC;
