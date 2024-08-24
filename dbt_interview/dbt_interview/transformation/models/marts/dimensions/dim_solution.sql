
with staging as (

    select * from {{ ref("stg_salesforce__solution") }}

),

dim_solution  as (

    select
        solution_id,
        isdeleted,
        solutionnumber,
        solutionname,
        ispublished,
        ispublishedinpublickb,
        status,
        isreviewed,
        solutionnote,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid,
        systemmodstamp
    from staging

)

select * from dim_solution
