WITH raw_data AS (
    SELECT * FROM {{ ref('bronzetable') }}  
),
silvertable AS (
    SELECT 
        Invoice, 
        StockCode, 
        Quantity, 
        InvoiceDate, 
        Price,
        Country
    FROM raw_data
    WHERE  Quantity > 0  
)

SELECT * FROM silvertable;