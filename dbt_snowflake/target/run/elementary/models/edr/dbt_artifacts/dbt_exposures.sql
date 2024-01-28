-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_exposures as DBT_INTERNAL_DEST
        using PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_exposures__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.unique_id = DBT_INTERNAL_DEST.unique_id
            )

    
    when matched then update set
        "UNIQUE_ID" = DBT_INTERNAL_SOURCE."UNIQUE_ID","NAME" = DBT_INTERNAL_SOURCE."NAME","MATURITY" = DBT_INTERNAL_SOURCE."MATURITY","TYPE" = DBT_INTERNAL_SOURCE."TYPE","OWNER_EMAIL" = DBT_INTERNAL_SOURCE."OWNER_EMAIL","OWNER_NAME" = DBT_INTERNAL_SOURCE."OWNER_NAME","URL" = DBT_INTERNAL_SOURCE."URL","DEPENDS_ON_MACROS" = DBT_INTERNAL_SOURCE."DEPENDS_ON_MACROS","DEPENDS_ON_NODES" = DBT_INTERNAL_SOURCE."DEPENDS_ON_NODES","DESCRIPTION" = DBT_INTERNAL_SOURCE."DESCRIPTION","TAGS" = DBT_INTERNAL_SOURCE."TAGS","META" = DBT_INTERNAL_SOURCE."META","PACKAGE_NAME" = DBT_INTERNAL_SOURCE."PACKAGE_NAME","ORIGINAL_PATH" = DBT_INTERNAL_SOURCE."ORIGINAL_PATH","PATH" = DBT_INTERNAL_SOURCE."PATH","GENERATED_AT" = DBT_INTERNAL_SOURCE."GENERATED_AT","METADATA_HASH" = DBT_INTERNAL_SOURCE."METADATA_HASH","LABEL" = DBT_INTERNAL_SOURCE."LABEL"
    

    when not matched then insert
        ("UNIQUE_ID", "NAME", "MATURITY", "TYPE", "OWNER_EMAIL", "OWNER_NAME", "URL", "DEPENDS_ON_MACROS", "DEPENDS_ON_NODES", "DESCRIPTION", "TAGS", "META", "PACKAGE_NAME", "ORIGINAL_PATH", "PATH", "GENERATED_AT", "METADATA_HASH", "LABEL")
    values
        ("UNIQUE_ID", "NAME", "MATURITY", "TYPE", "OWNER_EMAIL", "OWNER_NAME", "URL", "DEPENDS_ON_MACROS", "DEPENDS_ON_NODES", "DESCRIPTION", "TAGS", "META", "PACKAGE_NAME", "ORIGINAL_PATH", "PATH", "GENERATED_AT", "METADATA_HASH", "LABEL")

;
    commit;