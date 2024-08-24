
with account as (
    select *
    from {{ ref("stg_salesforce__account") }}     
),

product as (
    select *
    from {{ ref("stg_salesforce__product_2") }}
),

solution as(
    select *
    from {{ ref("stg_salesforce__solution") }}
),

stg_case as (
    select *   
    from {{ ref("stg_salesforce__case") }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(["stg_case.accountid","stg_case.case_id",
        "stg_case.contactid","stg_case.productid","solution.solution_id"]) }} as fact_case_sk,  
        stg_case.case_id,
        stg_case.contactid,
        stg_case.accountid,
        account.annualrevenue as account_annualrevenue,
        stg_case.assetid,
        stg_case.productid,
        product.quantityunitofmeasure as product_quantityunitofmeasure,
        product.stockkeepingunit as product_stockkeepingunit,
        stg_case.entitlementid,
        stg_case.sourceid,
        solution.solution_id,
        solution.timesused as solution_time
    from stg_case as stg_case
    left join account
    on stg_case.accountid = account.account_id
    left join product
    on stg_case.productid = product.product_id
    left join solution
    on stg_case.case_id = solution.caseid
)
select * from final

