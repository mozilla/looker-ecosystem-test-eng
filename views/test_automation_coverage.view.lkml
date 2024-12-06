view: test_automation_coverage {
  sql_table_name: `ecosystem-test-eng.testrail_metrics.test_automation_coverage` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: coverage {
    type: string
    sql: ${TABLE}.coverage ;;
  }
  dimension: testrail_id {
    type: number
    sql: ${TABLE}.testrail_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
