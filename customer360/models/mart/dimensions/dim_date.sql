WITH dates AS (

    SELECT
        DATEADD(
            day,
            ROW_NUMBER() OVER (ORDER BY seq4()) - 1,
            '2023-01-01'
        ) AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 2000))

)

SELECT

    date_day,

    YEAR(date_day) AS year,

    QUARTER(date_day) AS quarter,

    MONTH(date_day) AS month,

    MONTHNAME(date_day) AS month_name,

    WEEK(date_day) AS week_number,

    DAY(date_day) AS day_of_month,

    DAYNAME(date_day) AS day_name,

    CASE
        WHEN DAYOFWEEK(date_day) IN (1,7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend

FROM dates