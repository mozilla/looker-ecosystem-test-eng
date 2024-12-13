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

explore: autopushrs_averages {}

explore: autopushrs_coverage {}

explore: autopushrs_results {}

explore: autopushrs {}

explore: autopushrs_test_metrics {
  view_name: autopushrs_averages

  join: autopushrs_results {
    sql_on: ${autopushrs_results.repository} = ${autopushrs_averages.repository}
            AND ${autopushrs_results.workflow} = ${autopushrs_averages.workflow}
            AND ${autopushrs_results.test_suite} = ${autopushrs_averages.test_suite}
            AND ${autopushrs_results.timestamp_date} = ${autopushrs_averages.end_date_30_date} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: autopushrs_coverage {
    sql_on: ${autopushrs_results.repository} = ${autopushrs_coverage.repository}
            AND ${autopushrs_results.workflow} = ${autopushrs_coverage.workflow}
            AND ${autopushrs_results.test_suite} = ${autopushrs_coverage.test_suite}
            AND ${autopushrs_results.job_number} = ${autopushrs_coverage.job_number} ;;
    relationship: one_to_one
    type: left_outer
  }
}

explore: fxa_averages {}

explore: fxa_results {}

explore: merinopy_results {}

explore: merinopy_averages {}

explore: merinopy_coverage {}

explore: report_test_case_coverage {}

explore: test_automation_coverage {}

explore: test_automation_status {}

explore: testrail_projects {}

explore: report_test_case_coverage_by_project {}
