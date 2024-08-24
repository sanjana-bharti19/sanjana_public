 with user as (
    select * from {{ ref("stg_salesforce__user") }}
),

user_role as (
    select *
    from {{ ref("stg_salesforce__user_role") }}
),

account as (
    select *
    from {{ ref("stg_salesforce__account") }}     
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(["account.account_id",
            "user.user_id","user.userroleid"]) }} as fact_user_sk, 
        account.account_id,
        account.annualrevenue as account_annualrevenue,
        account.numberofemployees,   
        user.user_id,
        user.userroleid,
        user.profileid,
        user.delegatedapproverid,
        user.managerid,
        user.contactid,
        user.callcenterid,
        user.workspaceid,
        user.bannerphotoid,
        user_role.parentroleid,
        user_role.forecastuserid,
        user_role.portalaccountid
    from  account
    left join user
    on account.account_id = user.accountid 
    left join user_role
    on user.userroleid = user_role.user_role_id
)
select * from final