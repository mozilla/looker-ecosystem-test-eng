- dashboard: autopushrs_test_metrics
  title: Autopush-rs Test Metrics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 61ditkP9eQ8ZziqjZPCtDQ
  elements:
  - title: Skip Rate (%) vs Date
    name: Skip Rate (%) vs Date
    model: ecosystem-test-eng
    explore: autopushrs_results
    type: looker_line
    fields: [autopushrs_results.timestamp_date, unit_skipped_rate, integration_skipped_rate]
    fill_fields: [autopushrs_results.timestamp_date]
    sorts: [unit_skipped_rate desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Integration Skipped Rate
      value_format:
      value_format_name:
      based_on: autopushrs_results.skipped_rate
      _kind_hint: measure
      measure: integration_skipped_rate
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: Unit Skipped Rate
      value_format:
      value_format_name:
      based_on: autopushrs_results.skipped_rate
      _kind_hint: measure
      measure: unit_skipped_rate
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Skip Rate (%), orientation: left, series: [{axisId: skipped_rate_integration,
            id: skipped_rate_integration, name: Integration}, {axisId: skipped_rate_unit,
            id: skipped_rate_unit, name: Unit}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      skipped_rate_integration: "#FFA537"
      skipped_rate_unit: "#7F165B"
      unit_skipped_rate: "#7F165B"
      integration_skipped_rate: "#FFA537"
    series_labels:
      skipped_rate_integration: Integration
      skipped_rate_unit: Unit
      integration_skipped_rate: Integration
      unit_skipped_rate: Unit
    defaults_version: 1
    listen: {}
    row: 18
    col: 0
    width: 12
    height: 5
  - title: Time (s) vs Date
    name: Time (s) vs Date
    model: ecosystem-test-eng
    explore: autopushrs_results
    type: looker_line
    fields: [autopushrs_results.timestamp_date, unit_job_time, unit_run_time, integration_job_time,
      integration_run_time]
    fill_fields: [autopushrs_results.timestamp_date]
    sorts: [autopushrs_results.timestamp_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Unit Job Time
      value_format:
      value_format_name:
      based_on: autopushrs_results.job_time
      _kind_hint: measure
      measure: unit_job_time
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: " Integration Job Time"
      value_format:
      value_format_name:
      based_on: autopushrs_results.job_time
      _kind_hint: measure
      measure: integration_job_time
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: 'Unit Run Time '
      value_format:
      value_format_name:
      based_on: autopushrs_results.run_time
      _kind_hint: measure
      measure: unit_run_time
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Integration Run Time
      value_format:
      value_format_name:
      based_on: autopushrs_results.run_time
      _kind_hint: measure
      measure: integration_run_time
      type: average
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Time (s), orientation: left, series: [{axisId: job_time_unit,
            id: job_time_unit, name: Unit Job Time}, {axisId: run_time_unit, id: run_time_unit,
            name: Unit Run Time}, {axisId: job_time_integration, id: job_time_integration,
            name: Integration Job Time}, {axisId: run_time_integration, id: run_time_integration,
            name: Integration Run Time}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      job_time_unit: "#7F165B"
      job_time_integration: "#FFA537"
      run_time_unit: "#c78bb8"
      run_time_integration: "#ffe0ca"
      unit_job_time: "#7F165B"
      unit_run_time: "#c78bb8"
      integration_job_time: "#FFA537"
      integration_run_time: "#ffe0ca"
    series_labels:
      run_time_unit: Unit Run Time
      job_time_integration: Integration Job Time
      job_time_unit: Unit Job Time
      run_time_integration: Integration Run Time
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 12
    col: 0
    width: 12
    height: 6
  - title: Unit Test Coverage (%) vs Date
    name: Unit Test Coverage (%) vs Date
    model: ecosystem-test-eng
    explore: autopushrs_coverage
    type: looker_line
    fields: [autopushrs_coverage.timestamp_date, autopushrs_coverage.line_percent,
      autopushrs_coverage.function_percent]
    fill_fields: [autopushrs_coverage.timestamp_date]
    sorts: [autopushrs_coverage.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Coverage (%), orientation: left, series: [{axisId: autopushrs_coverage.line_percent,
            id: autopushrs_coverage.line_percent, name: Line Percent}, {axisId: autopushrs_coverage.function_percent,
            id: autopushrs_coverage.function_percent, name: Function Percent}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      autopushrs_coverage.line_percent: "#7F165B"
      autopushrs_coverage.function_percent: "#c78bb8"
    series_labels:
      autopushrs_coverage.line_percent: Line
      autopushrs_coverage.function_percent: Function
    defaults_version: 1
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 5
  - title: 90d Time (s) vs Date
    name: 90d Time (s) vs Date
    model: ecosystem-test-eng
    explore: autopushrs_averages
    type: looker_line
    fields: [autopushrs_averages.start_date_90_date, unit_job_time_90, unit_run_time_90,
      integration_job_time_90, integration_run_time_90]
    fill_fields: [autopushrs_averages.start_date_90_date]
    sorts: [autopushrs_averages.start_date_90_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Unit Job Time 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.job_time_90
      _kind_hint: measure
      measure: unit_job_time_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Unit Run Time 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.run_time_90
      _kind_hint: measure
      measure: unit_run_time_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Integration Job Time 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.job_time_90
      _kind_hint: measure
      measure: integration_job_time_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: Integration Run Time 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.run_time_90
      _kind_hint: measure
      measure: integration_run_time_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"integration_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      unit_job_time_90: "#7F165B"
      unit_run_time_90: "#c78bb8"
      integration_job_time_90: "#FFA537"
      integration_run_time_90: "#ffe0ca"
    series_labels:
      unit_job_time_90: Unit Job Time
      unit_run_time_90: Unit Run Time
      integration_job_time_90: Integration Job Time
      integration_run_time_90: Integration Run Time
    defaults_version: 1
    listen: {}
    row: 12
    col: 12
    width: 12
    height: 6
  - title: 90d Success Rate (%) vs Date
    name: 90d Success Rate (%) vs Date
    model: ecosystem-test-eng
    explore: autopushrs_averages
    type: looker_line
    fields: [autopushrs_averages.start_date_90_date, unit_success_rate_90, integration_success_rate_90]
    fill_fields: [autopushrs_averages.start_date_90_date]
    sorts: [unit_success_rate_90]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Unit Success Rate 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.success_rate_90
      _kind_hint: measure
      measure: unit_success_rate_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Integration Success Rate 90
      value_format:
      value_format_name:
      based_on: autopushrs_averages.success_rate_90
      _kind_hint: measure
      measure: integration_success_rate_90
      type: sum
      _type_hint: number
      filters:
        autopushrs_averages.test_suite: '"integration_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      unit_success_rate_90: "#7F165B"
      integration_success_rate_90: "#FFA537"
      unit_success_rate_90_1: "#7F165B"
      integration_success_rate_90_1: "#FFA537"
    series_labels:
      unit_success_rate_90: Unit
      integration_success_rate_90: Integration
      unit_success_rate_90_1: Unit
      integration_success_rate_90_1: Integration
    discontinuous_nulls: false
    defaults_version: 1
    hidden_fields:
    hidden_pivots: {}
    listen: {}
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Unit Test Status Count vs Date
    name: Unit Test Status Count vs Date
    model: ecosystem-test-eng
    explore: autopushrs_results
    type: looker_column
    fields: [autopushrs_results.timestamp_date, unit_success, unit_failure, unit_skipped,
      unit_unknown, autopushrs_results.job_number]
    filters:
      autopushrs_results.test_suite: '"rust_unit_tests"'
      autopushrs_results.count: ">0"
    sorts: [autopushrs_results.timestamp_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Unit Success
      value_format:
      value_format_name:
      based_on: autopushrs_results.success
      _kind_hint: measure
      measure: unit_success
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Unit Failure
      value_format:
      value_format_name:
      based_on: autopushrs_results.failure
      _kind_hint: measure
      measure: unit_failure
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Unit Skipped
      value_format:
      value_format_name:
      based_on: autopushrs_results.skipped
      _kind_hint: measure
      measure: unit_skipped
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    - category: measure
      expression:
      label: Unit Unknown
      value_format:
      value_format_name:
      based_on: autopushrs_results.unknown
      _kind_hint: measure
      measure: unit_unknown
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"rust_unit_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Test Status Count, orientation: left, series: [{axisId: unit_success,
            id: unit_success, name: Success}, {axisId: unit_failure, id: unit_failure,
            name: Failure}, {axisId: unit_skipped, id: unit_skipped, name: Skipped},
          {axisId: unit_unknown, id: unit_unknown, name: Unknown}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      unit_success: "#08B248"
      unit_failure: "#FC2E31"
      unit_skipped: "#808080"
      unit_unknown: "#FCBF00"
    series_labels:
      unit_success: Success
      unit_failure: Failure
      unit_skipped: Skipped
      unit_unknown: Unknown
    defaults_version: 1
    hidden_fields: [autopushrs_results.job_number]
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 6
  - title: Integration Test Status Count vs Date
    name: Integration Test Status Count vs Date
    model: ecosystem-test-eng
    explore: autopushrs_results
    type: looker_column
    fields: [autopushrs_results.timestamp_date, autopushrs_results.job_number, integration_success,
      integration_failure, integration_skipped, integration_unknown]
    filters:
      autopushrs_results.test_suite: '"integration_tests"'
      autopushrs_results.count: ">0"
    sorts: [autopushrs_results.timestamp_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Integration Success
      value_format:
      value_format_name:
      based_on: autopushrs_results.success
      _kind_hint: measure
      measure: integration_success
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: Integration Failure
      value_format:
      value_format_name:
      based_on: autopushrs_results.failure
      _kind_hint: measure
      measure: integration_failure
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: Integration Skipped
      value_format:
      value_format_name:
      based_on: autopushrs_results.skipped
      _kind_hint: measure
      measure: integration_skipped
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    - category: measure
      expression:
      label: Integration Unknown
      value_format:
      value_format_name:
      based_on: autopushrs_results.unknown
      _kind_hint: measure
      measure: integration_unknown
      type: sum
      _type_hint: number
      filters:
        autopushrs_results.test_suite: '"integration_tests"'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Test Count, orientation: left, series: [{axisId: integration_success,
            id: integration_success, name: Success}, {axisId: integration_failure,
            id: integration_failure, name: Failure}, {axisId: integration_skipped,
            id: integration_skipped, name: Skipped}, {axisId: integration_unknown,
            id: integration_unknown, name: Unknown}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      integration_success: "#08B248"
      integration_failure: "#FC2E31"
      integration_skipped: "#808080"
      integration_unknown: "#FC9200"
    series_labels:
      integration_success: Success
      integration_failure: Failure
      integration_skipped: Skipped
      integration_unknown: Unknown
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [autopushrs_results.job_number]
    row: 0
    col: 12
    width: 12
    height: 6
