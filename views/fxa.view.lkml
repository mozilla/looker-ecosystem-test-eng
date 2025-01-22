view: fxa {
  derived_table: {
    sql:
      SELECT
        r.Repository AS repository,
        r.Workflow AS workflow,
        r.`Test Suite` AS test_suite,
        COALESCE(a.`End Date 30`, DATE(r.Timestamp)) AS end_date_30,
        r.Timestamp AS results_timestamp,
        r.`Job Number` AS results_job_number,
        r.Status AS results_status,

        r.`Execution Time` AS results_execution_time,
        r.`Run Time` AS results_run_time,
        r.Success AS results_success,
        r.Failure AS results_failure,
        r.Skipped AS results_skipped,
        r.Fixme AS results_fixme,
        r.`Retry Count` AS results_retry_count,
        r.Total AS results_total,
        r.`Success Rate` AS results_success_rate,
        r.`Failure Rate` AS results_failure_rate,
        r.`Skipped Rate` AS results_skipped_rate,
        r.`Fixme Rate` AS results_fixme_rate,

        a.`Execution Time 30` AS averages_execution_time_30,
        a.`Execution Time 60` AS averages_execution_time_60,
        a.`Execution Time 90` AS averages_execution_time_90,
        a.`Run Time 30` AS averages_run_time_30,
        a.`Run Time 60` AS averages_run_time_60,
        a.`Run Time 90` AS averages_run_time_90,
        a.`Success Rate 30` AS averages_success_rate_30,
        a.`Success Rate 60` AS averages_success_rate_60,
        a.`Success Rate 90` AS averages_success_rate_90,
        a.`Suite Count 30` AS averages_suite_count_30,
        a.`Suite Count 60` AS averages_suite_count_60,
        a.`Suite Count 90` AS averages_suite_count_90,


      FROM `test_metrics.fxa_suite_results` r
      LEFT JOIN `test_metrics.fxa_averages` a
      ON r.Repository = a.Repository
      AND r.Workflow = a.Workflow
      AND r.`Test Suite` = a.`Test Suite`
      AND DATE(r.Timestamp) = a.`End Date 30`

      UNION ALL

      SELECT
        a.Repository AS repository,
        a.Workflow AS workflow,
        a.`Test Suite` AS test_suite,
        CAST(a.`End Date 30` AS DATE) AS end_date_30,
        r.Timestamp AS results_timestamp,
        r.`Job Number` AS results_job_number,
        r.Status AS results_status,

        r.`Execution Time` AS results_execution_time,
        r.`Run Time` AS results_run_time,
        r.Success AS results_success,
        r.Failure AS results_failure,
        r.Skipped AS results_skipped,
        r.Fixme AS results_fixme,
        r.`Retry Count` AS results_retry_count,
        r.Total AS results_total,
        r.`Success Rate` AS results_success_rate,
        r.`Failure Rate` AS results_failure_rate,
        r.`Skipped Rate` AS results_skipped_rate,
        r.`Fixme Rate` AS results_fixme_rate,

        a.`Execution Time 30` AS averages_execution_time_30,
        a.`Execution Time 60` AS averages_execution_time_60,
        a.`Execution Time 90` AS averages_execution_time_90,
        a.`Run Time 30` AS averages_run_time_30,
        a.`Run Time 60` AS averages_run_time_60,
        a.`Run Time 90` AS averages_run_time_90,
        a.`Success Rate 30` AS averages_success_rate_30,
        a.`Success Rate 60` AS averages_success_rate_60,
        a.`Success Rate 90` AS averages_success_rate_90,
        a.`Suite Count 30` AS averages_suite_count_30,
        a.`Suite Count 60` AS averages_suite_count_60,
        a.`Suite Count 90` AS averages_suite_count_90,

      FROM `test_metrics.fxa_averages` a
      LEFT JOIN `test_metrics.fxa_suite_results` r
      ON a.Repository = r.Repository
      AND a.Workflow = r.Workflow
      AND a.`Test Suite` = r.`Test Suite`
      AND a.`End Date 30` = DATE(r.Timestamp)
      WHERE r.Repository IS NULL
      AND r.Workflow IS NULL
      AND r.`Test Suite` IS NULL
      AND r.Timestamp IS NULL
      AND r.`Job Number` IS NULL ;;
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

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.end_date_30 ;;
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
          FROM `test_metrics.fxa_suite_results`
          WHERE
            `Test Suite` = ${test_suite}
            AND EXTRACT(YEAR FROM Timestamp) = EXTRACT(YEAR FROM ${timestamp_raw})
            AND EXTRACT(QUARTER FROM Timestamp) = EXTRACT(QUARTER FROM ${timestamp_raw})
        ) ;;
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
}
