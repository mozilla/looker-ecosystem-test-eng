# THIS VIEW IS NOT CURRENTLY IN USE

# The name of this view in Looker is "Autopushrs Coverage"
view: autopushrs_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.autopushrs_coverage` ;;

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

  # Measures
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: branch_count {
    type: sum
    sql: ${TABLE}.`Branch Count` ;;
  }

  measure:branch_covered {
    type: sum
    sql: ${TABLE}.`Branch Covered` ;;
  }

  measure: branch_not_covered {
    type: sum
    sql: ${TABLE}.`Branch Not Covered` ;;
  }

  measure: branch_percent {
    type: average
    sql: ${TABLE}.`Branch Percent` ;;
  }

  measure: function_count {
    type: sum
    sql: ${TABLE}.`Function Count` ;;
  }

  measure: function_covered {
    type: sum
    sql: ${TABLE}.`Function Covered` ;;
  }

  measure: function_not_covered {
    type: sum
    sql: ${TABLE}.`Function Not Covered` ;;
  }

  measure: function_percent {
    type: average
    sql: ${TABLE}.`Function Percent` ;;
  }

  measure: line_count {
    type: sum
    sql: ${TABLE}.`Line Count` ;;
  }

  measure: line_covered {
    type: sum
    sql: ${TABLE}.`Line Covered` ;;
  }

  measure: line_excluded {
    type: sum
    sql: ${TABLE}.`Line Excluded` ;;
  }

  measure: line_not_covered {
    type: sum
    sql: ${TABLE}.`Line Not Covered` ;;
  }

  measure: line_percent {
    type: average
    sql: ${TABLE}.`Line Percent` ;;
  }

  measure: count {
    type: count
  }
}
