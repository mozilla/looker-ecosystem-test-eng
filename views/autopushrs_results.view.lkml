# The name of this view in Looker is "Autopushrs Results"
view: autopushrs_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.autopushrs_results` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Execution Time" in Explore.

  dimension: execution_time {
    type: number
    sql: ${TABLE}.`Execution Time` ;;
  }

  dimension: failure {
    type: number
    sql: ${TABLE}.Failure ;;
  }

  dimension: failure_rate {
    type: number
    sql: ${TABLE}.`Failure Rate` ;;
  }

  dimension: fixme {
    type: number
    sql: ${TABLE}.Fixme ;;
  }

  dimension: fixme_rate {
    type: number
    sql: ${TABLE}.`Fixme Rate` ;;
  }

  dimension: job_number {
    type: number
    sql: ${TABLE}.`Job Number` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_job_number {
    type: sum
    sql: ${job_number} ;;  }
  measure: average_job_number {
    type: average
    sql: ${job_number} ;;  }

  dimension: job_time {
    type: number
    sql: ${TABLE}.`Job Time` ;;
  }

  dimension: repository {
    type: string
    sql: ${TABLE}.Repository ;;
  }

  dimension: retry_count {
    type: number
    sql: ${TABLE}.`Retry Count` ;;
  }

  dimension: run_time {
    type: number
    sql: ${TABLE}.`Run Time` ;;
  }

  dimension: skipped {
    type: number
    sql: ${TABLE}.Skipped ;;
  }

  dimension: skipped_rate {
    type: number
    sql: ${TABLE}.`Skipped Rate` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: success {
    type: number
    sql: ${TABLE}.Success ;;
  }

  dimension: success_rate {
    type: number
    sql: ${TABLE}.`Success Rate` ;;
  }

  dimension: test_suite {
    type: string
    sql: ${TABLE}.`Test Suite` ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }

  dimension: unknown {
    type: number
    sql: ${TABLE}.Unknown ;;
  }

  dimension: unknown_rate {
    type: number
    sql: ${TABLE}.`Unknown Rate` ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.Workflow ;;
  }
  measure: count {
    type: count
  }
}
