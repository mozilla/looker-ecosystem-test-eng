view: autopushrs {
  derived_table: {
    sql: SELECT
      -- All columns from autopushrs_averages
      a.*,

      -- All columns from autopushrs_results
      r.*,

      -- All columns from autopushrs_coverage
      c.*

      FROM ${autopushrs_averages.SQL_TABLE_NAME} a
      LEFT JOIN ${autopushrs_results.SQL_TABLE_NAME} r
      ON a.repository = r.repository
      AND a.workflow = r.workflow
      AND a.test_suite = r.test_suite
      AND a.end_date_30 = DATE(r.timestamp)
      LEFT JOIN ${autopushrs_coverage.SQL_TABLE_NAME} c
      ON a.repository = c.repository
      AND a.workflow = c.workflow
      AND a.test_suite = c.test_suite
      AND a.end_date_30 = DATE(c.timestamp)
      AND r.job_number = c.job_number ;;
  }

  dimension_group: results_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
    convert_tz: yes
  }

  dimension: is_last_quarter_date {
    type: yesno
    sql: ${results_timestamp_raw} = (
      SELECT MAX(Timestamp)
      FROM ${autopushrs_results.SQL_TABLE_NAME}
      WHERE
        EXTRACT(YEAR FROM Timestamp) = EXTRACT(YEAR FROM ${results_timestamp_raw})
        AND EXTRACT(QUARTER FROM Timestamp) = EXTRACT(QUARTER FROM ${results_timestamp_raw})
    ) ;;
  }
}
