view: testrail_projects {
  sql_table_name: `ecosystem-test-eng.testrail_metrics.projects` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }
  dimension: project_name_abbrev {
    type: string
    sql: ${TABLE}.project_name_abbrev ;;
  }
  dimension: testrail_project_id {
    type: number
    sql: ${TABLE}.testrail_project_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, project_name]
  }
}
