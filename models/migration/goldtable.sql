WITH goldtable AS (
    SELECT 
        CAST(InvoiceDate AS DATE) AS Date,  
        COUNT(DISTINCT Invoice) AS invoice_count,  
        SUM(Quantity) AS total_quantity_sold,     
        SUM(Quantity * Price) AS total_revenue    
    FROM {{ ref('silvertable') }}
    GROUP BY CAST(InvoiceDate AS DATE) 
)

SELECT 
    Date,
    invoice_count,
    total_quantity_sold,
    total_revenue
FROM goldtable
ORDER BY Date;
