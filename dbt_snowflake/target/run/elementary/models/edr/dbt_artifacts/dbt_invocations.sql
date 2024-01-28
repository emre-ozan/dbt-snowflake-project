-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_invocations as DBT_INTERNAL_DEST
        using PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_invocations__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.invocation_id = DBT_INTERNAL_DEST.invocation_id
            )

    
    when matched then update set
        "INVOCATION_ID" = DBT_INTERNAL_SOURCE."INVOCATION_ID","JOB_ID" = DBT_INTERNAL_SOURCE."JOB_ID","JOB_NAME" = DBT_INTERNAL_SOURCE."JOB_NAME","JOB_RUN_ID" = DBT_INTERNAL_SOURCE."JOB_RUN_ID","RUN_STARTED_AT" = DBT_INTERNAL_SOURCE."RUN_STARTED_AT","RUN_COMPLETED_AT" = DBT_INTERNAL_SOURCE."RUN_COMPLETED_AT","GENERATED_AT" = DBT_INTERNAL_SOURCE."GENERATED_AT","CREATED_AT" = DBT_INTERNAL_SOURCE."CREATED_AT","COMMAND" = DBT_INTERNAL_SOURCE."COMMAND","DBT_VERSION" = DBT_INTERNAL_SOURCE."DBT_VERSION","ELEMENTARY_VERSION" = DBT_INTERNAL_SOURCE."ELEMENTARY_VERSION","FULL_REFRESH" = DBT_INTERNAL_SOURCE."FULL_REFRESH","INVOCATION_VARS" = DBT_INTERNAL_SOURCE."INVOCATION_VARS","VARS" = DBT_INTERNAL_SOURCE."VARS","TARGET_NAME" = DBT_INTERNAL_SOURCE."TARGET_NAME","TARGET_DATABASE" = DBT_INTERNAL_SOURCE."TARGET_DATABASE","TARGET_SCHEMA" = DBT_INTERNAL_SOURCE."TARGET_SCHEMA","TARGET_PROFILE_NAME" = DBT_INTERNAL_SOURCE."TARGET_PROFILE_NAME","THREADS" = DBT_INTERNAL_SOURCE."THREADS","SELECTED" = DBT_INTERNAL_SOURCE."SELECTED","YAML_SELECTOR" = DBT_INTERNAL_SOURCE."YAML_SELECTOR","PROJECT_ID" = DBT_INTERNAL_SOURCE."PROJECT_ID","PROJECT_NAME" = DBT_INTERNAL_SOURCE."PROJECT_NAME","ENV" = DBT_INTERNAL_SOURCE."ENV","ENV_ID" = DBT_INTERNAL_SOURCE."ENV_ID","CAUSE_CATEGORY" = DBT_INTERNAL_SOURCE."CAUSE_CATEGORY","CAUSE" = DBT_INTERNAL_SOURCE."CAUSE","PULL_REQUEST_ID" = DBT_INTERNAL_SOURCE."PULL_REQUEST_ID","GIT_SHA" = DBT_INTERNAL_SOURCE."GIT_SHA","ORCHESTRATOR" = DBT_INTERNAL_SOURCE."ORCHESTRATOR","DBT_USER" = DBT_INTERNAL_SOURCE."DBT_USER","JOB_URL" = DBT_INTERNAL_SOURCE."JOB_URL","JOB_RUN_URL" = DBT_INTERNAL_SOURCE."JOB_RUN_URL","ACCOUNT_ID" = DBT_INTERNAL_SOURCE."ACCOUNT_ID"
    

    when not matched then insert
        ("INVOCATION_ID", "JOB_ID", "JOB_NAME", "JOB_RUN_ID", "RUN_STARTED_AT", "RUN_COMPLETED_AT", "GENERATED_AT", "CREATED_AT", "COMMAND", "DBT_VERSION", "ELEMENTARY_VERSION", "FULL_REFRESH", "INVOCATION_VARS", "VARS", "TARGET_NAME", "TARGET_DATABASE", "TARGET_SCHEMA", "TARGET_PROFILE_NAME", "THREADS", "SELECTED", "YAML_SELECTOR", "PROJECT_ID", "PROJECT_NAME", "ENV", "ENV_ID", "CAUSE_CATEGORY", "CAUSE", "PULL_REQUEST_ID", "GIT_SHA", "ORCHESTRATOR", "DBT_USER", "JOB_URL", "JOB_RUN_URL", "ACCOUNT_ID")
    values
        ("INVOCATION_ID", "JOB_ID", "JOB_NAME", "JOB_RUN_ID", "RUN_STARTED_AT", "RUN_COMPLETED_AT", "GENERATED_AT", "CREATED_AT", "COMMAND", "DBT_VERSION", "ELEMENTARY_VERSION", "FULL_REFRESH", "INVOCATION_VARS", "VARS", "TARGET_NAME", "TARGET_DATABASE", "TARGET_SCHEMA", "TARGET_PROFILE_NAME", "THREADS", "SELECTED", "YAML_SELECTOR", "PROJECT_ID", "PROJECT_NAME", "ENV", "ENV_ID", "CAUSE_CATEGORY", "CAUSE", "PULL_REQUEST_ID", "GIT_SHA", "ORCHESTRATOR", "DBT_USER", "JOB_URL", "JOB_RUN_URL", "ACCOUNT_ID")

;
    commit;