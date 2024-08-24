
with staging as (

    select * from {{ ref("stg_salesforce__user_role") }}

),

dim_user_role as (
    select
        user_role_id,
        name,
        rollupdescription,
        opportunityaccessforaccountowner,
        caseaccessforaccountowner,
        contactaccessforaccountowner,
        lastmodifieddate,
        lastmodifiedbyid
    from staging
)
select * from dim_user_role