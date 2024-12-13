view: autopushrs {
  derived_table: {
    sql: SELECT
      -- Columns from autopushrs_averages
      a.Repository AS repository,
      a.Workflow AS workflow,
      a.`Test Suite` AS test_suite,
      a.`End Date 30` AS end_date_30,
      a.`End Date 60` AS end_date_60,
      a.`End Date 90` AS end_date_90,
      a.`Start Date 30` AS start_date_30,
      a.`Start Date 60` AS start_date_60,
      a.`Start Date 90` AS start_date_90,
      a.`Execution Time 30` AS averages_execution_time_30,
      a.`Execution Time 60` AS averages_execution_time_60,
      a.`Execution Time 90` AS averages_execution_time_90,
      a.`Job Time 30` AS averages_job_time_30,
      a.`Job Time 60` AS averages_job_time_60,
      a.`Job Time 90` AS averages_job_time_90,
      a.`Run Time 30` AS averages_run_time_30,
      a.`Run Time 60` AS averages_run_time_60,
      a.`Run Time 90` AS averages_run_time_90,
      a.`Success Rate 30` AS averages_success_rate_30,
      a.`Success Rate 60` AS averages_success_rate_60,
      a.`Success Rate 90` AS averages_success_rate_90,
      a.`Suite Count 30` AS averages_suite_count_30,
      a.`Suite Count 60` AS averages_suite_count_60,
      a.`Suite Count 90` AS averages_suite_count_90,

      -- Columns from autopushrs_results
      r.Timestamp AS results_timestamp,
      r.`Job Number` AS results_job_number,
      r.Status AS results_status,
      r.`Execution Time` AS results_execution_time,
      r.`Job Time` AS results_job_time,
      r.`Run Time` AS results_run_time,
      r.Success AS results_success,
      r.Failure AS results_failure,
      r.Skipped AS results_skipped,
      r.Fixme AS results_fixme,
      r.Unknown AS results_unknown,
      r.`Retry Count` AS results_retry_count,
      r.Total AS results_total,
      r.`Success Rate` AS results_success_rate,
      r.`Failure Rate` AS results_failure_rate,
      r.`Skipped Rate` AS results_skipped_rate,
      r.`Fixme Rate` AS results_fixme_rate,
      r.`Unknown Rate` AS results_unknown_rate,

      -- Columns from autopushrs_coverage
      c.Timestamp AS coverage_timestamp,
      c.`Job Number` AS coverage_job_number,
      c.`Branch Count` AS coverage_branch_count,
      c.`Branch Covered` AS coverage_branch_covered,
      c.`Branch Not Covered` AS coverage_branch_not_covered,
      c.`Branch Percent` AS coverage_branch_percent,
      c.`Line Count` AS coverage_line_count,
      c.`Line Covered` AS coverage_line_covered,
      c.`Line Not Covered` AS coverage_line_not_covered,
      c.`Line Percent` AS coverage_line_percent,
      c.`Function Count` AS coverage_function_count,
      c.`Function Covered` AS coverage_function_covered,
      c.`Function Not Covered` AS coverage_function_not_covered,
      c.`Function Percent` AS coverage_function_percent

      FROM `test_metrics.autopushrs_averages` a
      LEFT JOIN `test_metrics.autopushrs_results` r
      ON a.Repository = r.Repository
      AND a.Workflow = r.Workflow
      AND a.`Test Suite` = r.`Test Suite`
      AND a.`End Date 30` = DATE(r.Timestamp)
      LEFT JOIN `test_metrics.autopushrs_coverage` c
      ON a.Repository = c.Repository
      AND a.Workflow = c.Workflow
      AND a.`Test Suite` = c.`Test Suite`
      AND a.`End Date 30` = DATE(c.Timestamp)
      AND r.`Job Number` = c.`Job Number` ;;
  }

  # Dimensions

  dimension: repository {
    type: string
    sql: ${TABLE}.repository ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.workflow ;;
  }

  dimension: test_suite {
    type: string
    sql: ${TABLE}.test_suite ;;
  }

  dimension: job_number {
    type: number
    value_format: "0"
    sql: ${TABLE}.results_job_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.results_status ;;
  }

  # Dates and Timestamps
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.end_date_30 ;;
  }

  dimension_group: start_date_30 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.start_date_30 ;;
  }

  dimension_group: start_date_60 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.start_date_60 ;;
  }

  dimension_group: start_date_90 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.start_date_90 ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    convert_tz: yes
    datatype: timestamp
    sql: ${TABLE}.results_timestamp ;;
  }

  dimension: is_last_quarter_date {
    type: yesno
    sql: ${timestamp_raw} = (
          SELECT MAX(Timestamp)
          FROM `test_metrics.autopushrs_results`
          WHERE
            EXTRACT(YEAR FROM Timestamp) = EXTRACT(YEAR FROM ${timestamp_raw})
            AND EXTRACT(QUARTER FROM Timestamp) = EXTRACT(QUARTER FROM ${timestamp_raw})
        ) ;;
  }


  # Measures
  measure: branch_count {
    type: sum
    sql: ${TABLE}.coverage_branch_count ;;
  }

  measure:branch_covered {
    type: sum
    sql: ${TABLE}.coverage_branch_covered ;;
  }

  measure: branch_not_covered {
    type: sum
    sql: ${TABLE}.coverage_branch_not_covered ;;
  }

  measure: branch_percent {
    type: average
    sql: ${TABLE}.coverage_branch_percent ;;
  }

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

  measure: job_time {
    type: average
    sql: ${TABLE}.results_job_time ;;
  }

  measure: job_time_30 {
    type: average
    sql: ${TABLE}.averages_job_time_30 ;;
  }

  measure: job_time_60 {
    type: average
    sql: ${TABLE}.averages_job_time_60 ;;
  }

  measure: job_time_90 {
    type: average
    sql: ${TABLE}.averages_job_time_90 ;;
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

  measure: unknown {
    type: sum
    sql: ${TABLE}.results_unknown ;;
  }

  measure: unknown_rate {
    type: average
    sql: ${TABLE}.results_unknown_rate ;;
  }
}