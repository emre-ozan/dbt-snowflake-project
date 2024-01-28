
  create or replace   view PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.monitors_runs
  
   as (
    

with data_monitoring_metrics as (

    select * from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.data_monitoring_metrics

),

max_bucket_end as (

    select full_table_name,
           column_name,
           metric_name,
           metric_properties,
           max(bucket_end) as last_bucket_end,
           min(bucket_end) as first_bucket_end
    from data_monitoring_metrics
    group by 1,2,3,4

)

select * from max_bucket_end
  );

