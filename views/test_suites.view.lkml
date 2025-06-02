view: test_suites {
  sql_table_name: `ecosystem-test-eng.testrail_metrics.test_suites` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: test_suite_name {
    type: string
    sql: ${TABLE}.test_suite_name ;;
  }
  dimension: testrail_project_id {
    type: number
    sql: ${TABLE}.testrail_project_id ;;
  }
  dimension: testrail_test_suites_id {
    type: number
    sql: ${TABLE}.testrail_test_suites_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, test_suite_name]
  }
}
