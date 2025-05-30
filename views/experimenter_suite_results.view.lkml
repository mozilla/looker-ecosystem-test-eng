# The name of this view in Looker is "Experimenter Suite Results"
view: experimenter_suite_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.experimenter_suite_results` ;;

  # Primary key for the view
  dimension: job_number {
    type: number
    primary_key: yes
    value_format: "0"
    sql: ${TABLE}.`Job Number` ;;
  }

  dimension: branch_count {
    type: number
    sql: ${TABLE}.`Branch Count` ;;
  }

  dimension: branch_covered {
    type: number
    sql: ${TABLE}.`Branch Covered` ;;
  }

  dimension: branch_not_covered {
    type: number
    sql: ${TABLE}.`Branch Not Covered` ;;
  }

  dimension: branch_percent {
    type: number
    sql: ${TABLE}.`Branch Percent` ;;
  }

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

  dimension: workflow {
    type: string
    sql: ${TABLE}.Workflow ;;
  }
  measure: count {
    type: count
  }
}
