view: fxa {
  derived_table: {
    sql:
      WITH fxa_averages AS (
        SELECT
          r.Repository AS repository,
          r.Workflow AS workflow,
          r.`Test Suite` AS test_suite,
          r.Timestamp AS timestamp,

        (SELECT AVG(sub_r.`Execution Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 30 DAY) AND r.Timestamp)
        AS execution_time_30,

        (SELECT AVG(sub_r.`Execution Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 60 DAY) AND r.Timestamp)
        AS execution_time_60,

        (SELECT AVG(sub_r.`Execution Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS execution_time_90,

        (SELECT AVG(sub_r.`Run Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 30 DAY) AND r.Timestamp)
        AS run_time_30,

        (SELECT AVG(sub_r.`Run Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 60 DAY) AND r.Timestamp)
        AS run_time_60,

        (SELECT AVG(sub_r.`Run Time`)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS run_time_90,

        (SELECT SAFE_MULTIPLY(SAFE_DIVIDE(COUNTIF(sub_r.Status = 'success'), COUNT(*)), 100)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 30 DAY) AND r.Timestamp)
        AS success_rate_30,

        (SELECT SAFE_MULTIPLY(SAFE_DIVIDE(COUNTIF(sub_r.Status = 'success'), COUNT(*)), 100)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 60 DAY) AND r.Timestamp)
        AS success_rate_60,

        (SELECT SAFE_MULTIPLY(SAFE_DIVIDE(COUNTIF(sub_r.Status = 'success'), COUNT(*)), 100)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS success_rate_90,

        (SELECT COUNT(*)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 30 DAY) AND r.Timestamp)
        AS suite_count_30,

        (SELECT COUNT(*)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 60 DAY) AND r.Timestamp)
        AS suite_count_60,

        (SELECT COUNT(*)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS suite_count_90,

        (SELECT AVG(SAFE_DIVIDE(sub_r.Total, sub_r.`Execution Time`))
          FROM `test_metrics.fxa_suite_results` sub_r
          WHERE sub_r.Repository = r.Repository
            AND sub_r.Workflow = r.Workflow
            AND sub_r.`Test Suite` = r.`Test Suite`
            AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS tests_per_second_90_rolling,

        (SELECT AVG(SAFE_DIVIDE(sub_r.Total, sub_r.`Execution Time`) * 60)
         FROM `test_metrics.fxa_suite_results` sub_r
         WHERE sub_r.Repository = r.Repository
           AND sub_r.Workflow = r.Workflow
           AND sub_r.`Test Suite` = r.`Test Suite`
           AND sub_r.Timestamp BETWEEN TIMESTAMP_SUB(r.Timestamp, INTERVAL 90 DAY) AND r.Timestamp)
        AS tests_per_minute_90_rolling,

      FROM `test_metrics.fxa_suite_results` r
      GROUP BY r.Repository, r.Workflow, r.`Test Suite`, r.Timestamp
      )

      SELECT
        r.Repository AS repository,
        r.Workflow AS workflow,
        r.`Test Suite` AS test_suite,
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

        a.execution_time_30 AS averages_execution_time_30,
        a.execution_time_60 AS averages_execution_time_60,
        a.execution_time_90 AS averages_execution_time_90,
        a.run_time_30 AS averages_run_time_30,
        a.run_time_60 AS averages_run_time_60,
        a.run_time_90 AS averages_run_time_90,
        a.success_rate_30 AS averages_success_rate_30,
        a.success_rate_60 AS averages_success_rate_60,
        a.success_rate_90 AS averages_success_rate_90,
        a.suite_count_30 AS averages_suite_count_30,
        a.suite_count_60 AS averages_suite_count_60,
        a.suite_count_90 AS averages_suite_count_90,
        a.tests_per_second_90_rolling AS averages_tests_per_second_90_rolling,
        a.tests_per_minute_90_rolling AS averages_tests_per_minute_90_rolling,

      FROM `test_metrics.fxa_suite_results` r
      LEFT JOIN fxa_averages a
        ON r.Repository = a.repository
          AND r.Workflow = a.workflow
          AND r.`Test Suite` = a.test_suite
          AND r.Timestamp = a.timestamp ;;
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
            `Workflow` = ${workflow}
            AND `Test Suite` = ${test_suite}
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

  measure: tests_per_second {
    type: number
    value_format_name: "decimal_2"
    sql: SAFE_DIVIDE(${total}, ${execution_time}) ;;
    label: "Tests per second"
    description: "Number of tests executed per second"
  }

  measure: tests_per_minute {
    type: number
    value_format_name: "decimal_2"
    sql: SAFE_DIVIDE(SAFE_DIVIDE(${total}, ${execution_time}), 60) ;;
    label: "Tests per minute"
    description: "Number of tests executed per minute"
  }

  measure: tests_per_second_rolling_90_avg {
    type:  average
    value_format_name: "decimal_2"
    sql: ${TABLE}.averages_tests_per_second_90_rolling ;;
    label: "Tests per second (90-day-rolling avg)"
    description: "Average number of tests executed per second, over the past 90 days"
  }

  measure: tests_per_minute_rolling_90_avg {
    type:  average
    value_format_name: "decimal_2"
    sql: ${TABLE}.averages_tests_per_minute_90_rolling ;;
    label: "Tests per minute (90-day-rolling avg)"
    description: "Average number of tests executed per minute, over the past 90 days"
  }
}
