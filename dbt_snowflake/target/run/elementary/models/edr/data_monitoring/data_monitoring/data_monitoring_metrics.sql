-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.data_monitoring_metrics as DBT_INTERNAL_DEST
        using PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.data_monitoring_metrics__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.id = DBT_INTERNAL_DEST.id
            )

    
    when matched then update set
        "ID" = DBT_INTERNAL_SOURCE."ID","FULL_TABLE_NAME" = DBT_INTERNAL_SOURCE."FULL_TABLE_NAME","COLUMN_NAME" = DBT_INTERNAL_SOURCE."COLUMN_NAME","METRIC_NAME" = DBT_INTERNAL_SOURCE."METRIC_NAME","METRIC_VALUE" = DBT_INTERNAL_SOURCE."METRIC_VALUE","SOURCE_VALUE" = DBT_INTERNAL_SOURCE."SOURCE_VALUE","BUCKET_START" = DBT_INTERNAL_SOURCE."BUCKET_START","BUCKET_END" = DBT_INTERNAL_SOURCE."BUCKET_END","BUCKET_DURATION_HOURS" = DBT_INTERNAL_SOURCE."BUCKET_DURATION_HOURS","UPDATED_AT" = DBT_INTERNAL_SOURCE."UPDATED_AT","DIMENSION" = DBT_INTERNAL_SOURCE."DIMENSION","DIMENSION_VALUE" = DBT_INTERNAL_SOURCE."DIMENSION_VALUE","METRIC_PROPERTIES" = DBT_INTERNAL_SOURCE."METRIC_PROPERTIES","CREATED_AT" = DBT_INTERNAL_SOURCE."CREATED_AT"
    

    when not matched then insert
        ("ID", "FULL_TABLE_NAME", "COLUMN_NAME", "METRIC_NAME", "METRIC_VALUE", "SOURCE_VALUE", "BUCKET_START", "BUCKET_END", "BUCKET_DURATION_HOURS", "UPDATED_AT", "DIMENSION", "DIMENSION_VALUE", "METRIC_PROPERTIES", "CREATED_AT")
    values
        ("ID", "FULL_TABLE_NAME", "COLUMN_NAME", "METRIC_NAME", "METRIC_VALUE", "SOURCE_VALUE", "BUCKET_START", "BUCKET_END", "BUCKET_DURATION_HOURS", "UPDATED_AT", "DIMENSION", "DIMENSION_VALUE", "METRIC_PROPERTIES", "CREATED_AT")

;
    commit;