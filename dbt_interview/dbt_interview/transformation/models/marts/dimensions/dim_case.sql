
with staging as (

    select * from {{ ref("stg_salesforce__case") }}

),

dim_case as (

    select
        case_id,
        isdeleted,
        masterrecordid,
        casenumber,
        suppliedname,
        suppliedemail,
        suppliedphone,
        suppliedcompany,
        type,
        status,
        reason,
        origin,
        subject,
        priority,
        description,
        isclosed,
        closeddate,
        isescalated,
        ownerid,
        isclosedoncreate,
        slastartdate,
        slaexitdate,
        isstopped,
        stopstartdate,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid
    from staging

)

select * from dim_case
