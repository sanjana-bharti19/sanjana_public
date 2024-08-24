
with staging as (
    select * from {{ ref("stg_salesforce__product_2") }}

),

dim_product as (

    select
        product_id,
        name,
        productcode,
        description,
        isactive,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid,
        systemmodstamp,
        family,
        displayurl,
        isdeleted,
        isarchived,
        type,
        productclass
    from staging

)

select * from dim_product