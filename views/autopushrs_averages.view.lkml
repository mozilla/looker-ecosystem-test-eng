# The name of this view in Looker is "Autopushrs Averages"
view: autopushrs_averages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.autopushrs_averages` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end_date_30 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`End Date 30` ;;
  }

  dimension_group: end_date_60 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`End Date 60` ;;
  }

  dimension_group: end_date_90 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`End Date 90` ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Execution Time 30" in Explore.

  dimension: execution_time_30 {
    type: number
    sql: ${TABLE}.`Execution Time 30` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_execution_time_30 {
    type: sum
    sql: ${execution_time_30} ;;  }
  measure: average_execution_time_30 {
    type: average
    sql: ${execution_time_30} ;;  }

  dimension: execution_time_60 {
    type: number
    sql: ${TABLE}.`Execution Time 60` ;;
  }

  dimension: execution_time_90 {
    type: number
    sql: ${TABLE}.`Execution Time 90` ;;
  }

  dimension: job_time_30 {
    type: number
    sql: ${TABLE}.`Job Time 30` ;;
  }

  dimension: job_time_60 {
    type: number
    sql: ${TABLE}.`Job Time 60` ;;
  }

  dimension: job_time_90 {
    type: number
    sql: ${TABLE}.`Job Time 90` ;;
  }

  dimension: repository {
    type: string
    sql: ${TABLE}.Repository ;;
  }

  dimension: run_time_30 {
    type: number
    sql: ${TABLE}.`Run Time 30` ;;
  }

  dimension: run_time_60 {
    type: number
    sql: ${TABLE}.`Run Time 60` ;;
  }

  dimension: run_time_90 {
    type: number
    sql: ${TABLE}.`Run Time 90` ;;
  }

  dimension_group: start_date_30 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`Start Date 30` ;;
  }

  dimension_group: start_date_60 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`Start Date 60` ;;
  }

  dimension_group: start_date_90 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`Start Date 90` ;;
  }

  dimension: success_rate_30 {
    type: number
    sql: ${TABLE}.`Success Rate 30` ;;
  }

  dimension: success_rate_60 {
    type: number
    sql: ${TABLE}.`Success Rate 60` ;;
  }

  dimension: success_rate_90 {
    type: number
    sql: ${TABLE}.`Success Rate 90` ;;
  }

  dimension: suite_count_30 {
    type: number
    sql: ${TABLE}.`Suite Count 30` ;;
  }

  dimension: suite_count_60 {
    type: number
    sql: ${TABLE}.`Suite Count 60` ;;
  }

  dimension: suite_count_90 {
    type: number
    sql: ${TABLE}.`Suite Count 90` ;;
  }

  dimension: test_suite {
    type: string
    sql: ${TABLE}.`Test Suite` ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.Workflow ;;
  }
  measure: count {
    type: count
  }
}
