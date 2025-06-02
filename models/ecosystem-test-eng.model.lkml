# Define the database connection to be used for this model.
connection: "ecosystem-test-eng"

# include all the views
include: "/views/**/*.view.lkml"

# include all the dashboards
include: "/dashboards/**/*.dashboard.lookml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

explore: autopushrs_averages {}

explore: autopushrs_coverage {}

explore: fxa_averages {}

explore: fxa_results {}

explore: merinopy_results {}

explore: merinopy_averages {}

explore: merinopy_coverage {}

explore: autopushrs_results {}

explore: report_test_case_coverage {}

explore: test_automation_coverage {}

explore: test_automation_status {}

explore: testrail_projects {}

explore: report_test_case_coverage_by_project {}

explore: experimenter_coverage {}

explore: experimenter_suite_results {}

explore: experimenter_results {}

explore: experimenter_averages {}
