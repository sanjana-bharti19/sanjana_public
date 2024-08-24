
with staging as (

    select * from {{ ref("stg_salesforce__account") }}

),

dim_account as (

    select
        account_id,
        isdeleted,
        masterrecordid,
        name,
        type,
        parentid,
        billingstreet,
        billingcity,
        billingstate,
        billingpostalcode,
        billingcountry,
        billinglatitude,
        billinglongitude,
        billinggeocodeaccuracy,
        shippingstreet,
        shippingcity,
        shippingstate,
        shippingpostalcode,
        shippingcountry,
        shippinglatitude,
        shippinglongitude,
        shippinggeocodeaccuracy,
        phone,
        fax,
        accountnumber,
        website,
        sic,
        industry,
        ownership,
        tickersymbol,
        description,
        rating,
        site,
        ownerid,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid,
        systemmodstamp,
        lastactivitydate,
        jigsaw,
        cleanstatus,
        accountsource,
        tradestyle,
        naicscode,
        naicsdesc,
        yearstarted,
        sicdesc
    from staging

)

select * from dim_account
