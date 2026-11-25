-- Business question: How are applicants distributed across risk score bands?
-- A transparent 0-100 risk score is built from five weighted risk drivers.
SELECT
    CASE
        WHEN risk_score < 20 THEN '01 Very Low (0-19)'
        WHEN risk_score < 40 THEN '02 Low (20-39)'
        WHEN risk_score < 60 THEN '03 Medium (40-59)'
        WHEN risk_score < 80 THEN '04 High (60-79)'
        ELSE                      '05 Very High (80-100)'
    END                                                   AS risk_band,
    COUNT(*)                                              AS applicants,
    SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END)        AS defaults,
    ROUND(100.0 * SUM(CASE WHEN Risk = 'Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(LoanAmount), 0)                             AS avg_loan_amount
FROM (
    SELECT
        Risk,
        LoanAmount,
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
GROUP BY risk_band
ORDER BY risk_band;
