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

explore: fxa_test_metrics {
  view_name: fxa
}

explore: merinopy_test_metrics {
  view_name: merinopy
}

explore: syncstoragers_test_metrics {
  view_name: syncstoragers
}

explore: experimenter_test_metrics {
  view_name: experimenter
}

explore: report_test_case_coverage {}

explore: test_automation_coverage {}

explore: test_automation_status {}

explore: testrail_projects {}

explore: report_test_case_coverage_by_project {}
