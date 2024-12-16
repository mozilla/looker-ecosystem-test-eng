# Define the database connection to be used for this model.
connection: "ecosystem-test-eng"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

explore: autopushrs_test_metrics {
  view_name: autopushrs
}

explore: fxa_averages {}

explore: fxa_results {}

explore: merinopy_results {}

explore: merinopy_averages {}

explore: merinopy_coverage {}

explore: merinopy_automated_test_metrics {
  view_name: merinopy_averages

  join: merinopy_results {
    type: left_outer
    relationship: many_to_one
    sql_on: ${merinopy_averages.repository} = ${merinopy_results.repository}
          AND ${merinopy_averages.workflow} = ${merinopy_results.workflow}
          AND ${merinopy_averages.test_suite} = ${merinopy_results.test_suite}
          AND ${merinopy_averages.end_date_30_date} = ${merinopy_results.timestamp_date} ;;
  }

  join: merinopy_coverage {
    type: left_outer
    relationship: many_to_one
    sql_on: ${merinopy_averages.repository} = ${merinopy_coverage.repository}
          AND ${merinopy_averages.workflow} = ${merinopy_coverage.workflow}
          AND ${merinopy_averages.test_suite} = ${merinopy_coverage.test_suite}
          AND ${merinopy_averages.end_date_30_date} = ${merinopy_coverage.timestamp_date}
          AND ${merinopy_results.job_number} = ${merinopy_coverage.job_number} ;;
  }
}

explore: report_test_case_coverage {}

explore: test_automation_coverage {}

explore: test_automation_status {}

explore: testrail_projects {}

explore: report_test_case_coverage_by_project {}
