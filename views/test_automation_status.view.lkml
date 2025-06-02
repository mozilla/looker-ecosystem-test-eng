view: test_automation_status {
  sql_table_name: `ecosystem-test-eng.testrail_metrics.test_automation_status` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
