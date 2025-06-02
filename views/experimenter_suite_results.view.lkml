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

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.Workflow ;;
  }
  # Measures
  measure: execution_time {
    type: average
    sql: ${TABLE}.results_execution_time ;;
  }

  measure: execution_time_30 {
    type: average
    sql: ${TABLE}.averages_execution_time_30 ;;
  }

  measure: execution_time_60 {
    type: average
    sql: ${TABLE}.averages_execution_time_60 ;;
  }

  measure: execution_time_90 {
    type: average
    sql: ${TABLE}.averages_execution_time_90 ;;
  }

  measure: failure {
    type: sum
    sql: ${TABLE}.results_failure ;;
  }

  measure: failure_rate {
    type: average
    sql: ${TABLE}.results_failure_rate ;;
  }

  measure: fixme {
    type: sum
    sql: ${TABLE}.results_fixme ;;
  }

  measure: fixme_rate {
    type: average
    sql: ${TABLE}.results_fixme_rate ;;
  }

  measure: function_count {
    type: sum
    sql: ${TABLE}.coverage_function_count ;;
  }

  measure: function_covered {
    type: sum
    sql: ${TABLE}.coverage_function_covered ;;
  }

  measure: function_not_covered {
    type: sum
    sql: ${TABLE}.coverage_function_not_covered ;;
  }

  measure: function_percent {
    type: average
    sql: ${TABLE}.coverage_function_percent ;;
  }

  measure: line_count {
    type: sum
    sql: ${TABLE}.coverage_line_count ;;
  }

  measure: line_covered {
    type: sum
    sql: ${TABLE}.coverage_line_covered ;;
  }

  measure: line_excluded {
    type: sum
    sql: ${TABLE}.coverage_line_excluded ;;
  }

  measure: line_not_covered {
    type: sum
    sql: ${TABLE}.coverage_line_covered ;;
  }

  measure: line_percent {
    type: average
    sql: ${TABLE}.coverage_line_percent ;;
  }

  measure: retry_count {
    type: sum
    sql: ${TABLE}.results_retry_count ;;
  }

  measure: run_time {
    type: average
    sql: ${TABLE}.results_run_time ;;
  }

  measure: run_time_30 {
    type: average
    sql: ${TABLE}.averages_run_time_30 ;;
  }

  measure: run_time_60 {
    type: average
    sql: ${TABLE}.averages_run_time_60 ;;
  }

  measure: run_time_90 {
    type: average
    sql: ${TABLE}.averages_run_time_90 ;;
  }

  measure: skipped {
    type: sum
    sql: ${TABLE}.results_skipped ;;
  }

  measure: skipped_rate {
    type: average
    sql: ${TABLE}.results_skipped_rate ;;
  }

  measure: success {
    type: sum
    sql: ${TABLE}.results_success ;;
  }

  measure: success_rate {
    type: average
    sql: ${TABLE}.results_success_rate ;;
  }

  measure: success_rate_30 {
    type: average
    sql: ${TABLE}.averages_success_rate_30 ;;
  }

  measure: success_rate_60 {
    type: average
    sql: ${TABLE}.averages_success_rate_60 ;;
  }

  measure: success_rate_90 {
    type: average
    sql: ${TABLE}.averages_success_rate_90 ;;
  }

  measure: suite_count_30 {
    type: sum
    sql: ${TABLE}.averages_suite_count_30 ;;
  }

  measure: suite_count_60 {
    type: sum
    sql: ${TABLE}.averages_suite_count_60 ;;
  }

  measure: suite_count_90 {
    type: sum
    sql: ${TABLE}.averages_suite_count_90 ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.results_total ;;
  }

  measure: count {
    type: count
  }
}
