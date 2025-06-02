# The name of this view in Looker is "Experimenter Coverage"
view: experimenter_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_metrics.experimenter_coverage` ;;

  # Dimensions
  # A dimension is a groupable field that can be used to filter query results.

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

  dimension: statement_count {
    type: number
    sql: ${TABLE}.`Statement Count` ;;
  }

  dimension: statement_covered {
    type: number
    sql: ${TABLE}.`Statement Covered` ;;
  }

  dimension: statement_not_covered {
    type: number
    sql: ${TABLE}.`Statement Not Covered` ;;
  }

  dimension: statement_percent {
    type: number
    sql: ${TABLE}.`Statement Percent` ;;
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
