# The name of this view in Looker is "Merinopy Averages"
view: merinopy_averages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.merinopy_averages` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dimensions
  # A dimension is a groupable field that can be used to filter query results.

  dimension: repository {
    type: string
    sql: ${TABLE}.Repository ;;
  }

  dimension: test_suite {
    type: string
    sql: ${TABLE}.`Test Suite` ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.Workflow ;;
  }

  # Dates and Timestamps
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`End Date 90` ;;
  }

  # Measures
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: execution_time_30 {
    type: average
    sql: ${TABLE}.`Execution Time 30` ;;
  }

  measure: execution_time_60 {
    type: average
    sql: ${TABLE}.`Execution Time 60` ;;
  }

  measure: execution_time_90 {
    type: average
    sql: ${TABLE}.`Execution Time 90` ;;
  }

  measure: job_time_30 {
    type: average
    sql: ${TABLE}.`Job Time 30` ;;
  }

  measure: job_time_60 {
    type: average
    sql: ${TABLE}.`Job Time 60` ;;
  }

  measure: job_time_90 {
    type: average
    sql: ${TABLE}.`Job Time 90` ;;
  }

  measure: run_time_30 {
    type: average
    sql: ${TABLE}.`Run Time 30` ;;
  }

  measure: run_time_60 {
    type: average
    sql: ${TABLE}.`Run Time 60` ;;
  }

  measure: run_time_90 {
    type: average
    sql: ${TABLE}.`Run Time 90` ;;
  }

  measure: success_rate_30 {
    type: average
    sql: ${TABLE}.`Success Rate 30` ;;
  }

  measure: success_rate_60 {
    type: average
    sql: ${TABLE}.`Success Rate 60` ;;
  }

  measure: success_rate_90 {
    type: average
    sql: ${TABLE}.`Success Rate 90` ;;
  }

  measure: suite_count_30 {
    type: sum
    sql: ${TABLE}.`Suite Count 30` ;;
  }

  measure: suite_count_60 {
    type: sum
    sql: ${TABLE}.`Suite Count 60` ;;
  }

  measure: suite_count_90 {
    type: sum
    sql: ${TABLE}.`Suite Count 90` ;;
  }
}
