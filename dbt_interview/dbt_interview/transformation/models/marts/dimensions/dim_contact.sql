
with staging as (

    select * from {{ ref("stg_salesforce__contact") }}

),

dim_contact as (

    select
        contact_id,
        isdeleted,
        masterrecordid,
        salutation,
        firstname,
        lastname,
        otherstreet,
        othercity,
        otherstate,
        otherpostalcode,
        othercountry,
        otherlatitude,
        otherlongitude,
        othergeocodeaccuracy,
        mailingstreet,
        mailingcity,
        mailingstate,
        mailingpostalcode,
        mailingcountry,
        mailinglatitude,
        mailinglongitude,
        mailinggeocodeaccuracy,
        phone,
        fax,
        mobilephone,
        homephone,
        otherphone,
        assistantphone,
        reportstoid,
        email,
        title,
        department,
        assistantname,
        leadsource,
        birthdate,
        description,
        ownerid,
        hasoptedoutofemail,
        hasoptedoutoffax,
        donotcall,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid,
        systemmodstamp,
        lastactivitydate,
        lastcurequestdate,
        lastcuupdatedate,
        emailbouncedreason,
        emailbounceddate,
        jigsaw,
        pronouns,
        genderidentity,
        level__c,
        languages__c

    from staging

)

select * from dim_contact