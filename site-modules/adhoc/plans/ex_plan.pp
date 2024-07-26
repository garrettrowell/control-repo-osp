plan adhoc::ex_plan (
  TargetSpec $targets,
) {
  $result_or_error = run_task('adhoc::example', $targets, '_catch_errors' => true, 'message' => 'first task')

  $result = case $result_or_error {
    # When the plan returned a ResultSet use it.
    ResultSet: { $result_or_error }
    # If the run_task failed extract the result set from the error.
    Error['bolt/run-failure'] : { $result_or_error.details['result_set'] }
    # The sub-plan failed for an unexpected reason.
    default : { fail_plan($result_or_error) }
  }

  # run this only on successful targets
  run_task('adhoc::example', $result.ok_set.targets, '_catch_errors' => true, 'message' => 'second task')

  apply_prep($result.ok_set.targets)
  apply($result.ok_set.targets) {
    file { '/tmp/bolt_ex':
      ensure  => file,
      content => $facts['networking']['hostname']
    }
  }
}
