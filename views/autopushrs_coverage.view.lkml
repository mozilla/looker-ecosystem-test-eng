# The name of this view in Looker is "Autopushrs Coverage"
view: autopushrs_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.autopushrs_coverage` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Branch Count" in Explore.

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

  dimension: function_count {
    type: number
    sql: ${TABLE}.`Function Count` ;;
  }

  dimension: function_covered {
    type: number
    sql: ${TABLE}.`Function Covered` ;;
  }

  dimension: function_not_covered {
    type: number
    sql: ${TABLE}.`Function Not Covered` ;;
  }

  dimension: function_percent {
    type: number
    sql: ${TABLE}.`Function Percent` ;;
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

  dimension: line_count {
    type: number
    sql: ${TABLE}.`Line Count` ;;
  }

  dimension: line_covered {
    type: number
    sql: ${TABLE}.`Line Covered` ;;
  }

  dimension: line_excluded {
    type: number
    sql: ${TABLE}.`Line Excluded` ;;
  }

  dimension: line_not_covered {
    type: number
    sql: ${TABLE}.`Line Not Covered` ;;
  }

  dimension: line_percent {
    type: number
    sql: ${TABLE}.`Line Percent` ;;
  }

  dimension: repository {
    type: string
    sql: ${TABLE}.Repository ;;
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
  measure: count {
    type: count
  }
}
