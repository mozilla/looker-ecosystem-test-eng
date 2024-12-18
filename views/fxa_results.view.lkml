# The name of this view in Looker is "FxA Results"
view: fxa_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.fxa_results` ;;

  # Dimensions
  # A dimension is a groupable field that can be used to filter query results.

  # Primary key for the view
  dimension: job_number {
    type: number
    primary_key: yes
    value_format: "0"
    sql: ${TABLE}.`Job Number` ;;
  }

  dimension: repository {
    type: string
    sql: ${TABLE}.Repository ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
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

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    convert_tz: yes
    datatype: timestamp
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: is_last_quarter_date {
    type: yesno
    sql: ${TABLE}.`Is Last Quarter Date` ;;
  }

  # Measures
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: execution_time {
    type: average
    sql: ${TABLE}.`Execution Time` ;;
  }

  measure: failure {
    type: sum
    sql: ${TABLE}.Failure ;;
  }

  measure: failure_rate {
    type: average
    sql: ${TABLE}.`Failure Rate` ;;
  }

  measure: fixme {
    type: sum
    sql: ${TABLE}.Fixme ;;
  }

  measure: fixme_rate {
    type: average
    sql: ${TABLE}.`Fixme Rate` ;;
  }

  measure: job_time {
    type: average
    sql: ${TABLE}.`Job Time` ;;
  }

  measure: retry_count {
    type: sum
    sql: ${TABLE}.`Retry Count` ;;
  }

  measure: run_time {
    type: average
    sql: ${TABLE}.`Run Time` ;;
  }

  measure: skipped {
    type: sum
    sql: ${TABLE}.Skipped ;;
  }

  measure: skipped_rate {
    type: average
    sql: ${TABLE}.`Skipped Rate` ;;
  }

  measure: success {
    type: sum
    sql: ${TABLE}.Success ;;
  }

  measure: success_rate {
    type: average
    sql: ${TABLE}.`Success Rate` ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.Total ;;
  }

  measure: unknown {
    type: sum
    sql: ${TABLE}.Unknown ;;
  }

  measure: unknown_rate {
    type: average
    sql: ${TABLE}.`Unknown Rate` ;;
  }

  measure: count {
    type: count
  }
}
