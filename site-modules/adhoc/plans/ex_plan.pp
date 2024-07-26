plan adhoc::ex_plan (
  String $targets,
) {
  $_targets = get_targets($targets)
  $result_or_error = run_task('adhoc::example', '_catch_errors' => true, $_targets)

  $result = case $result_or_error {
    # When the plan returned a ResultSet use it.
    ResultSet: { $result_or_error }
    # If the run_task failed extract the result set from the error.
    Error['bolt/run-failure'] : { $result_or_error.details['result_set'] }
    # The sub-plan failed for an unexpected reason.
    default : { fail_plan($result_or_error) }
  }

  # run this only on successful targets
  run_task('adhoc::example', '_catch_errors' => true, $result.ok_set)
}
