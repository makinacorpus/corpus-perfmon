{% import "makina-states/services/monitoring/circus/macros.jinja" as circus with context %}
{% set cfg = opts.ms_project %}
{% set data = cfg.data %}

include:
  - makina-states.services.monitoring.circus 
{% set circus_data = {
  'cmd': 'java -jar CMDRunner.jar --tool PerfMonAgent',
  'environment': {},
  'uid': cfg.user,
  'shell': false,
  'gid': cfg.group,
  'stop_children': true,
  'stop_signal': 9,
  'copy_env': True,
  'working_dir': "{0}/p".format(cfg.project_root),
  'warmup_delay': "10",
  'max_age': 24*60*60} %}
{{ circus.circusAddWatcher(cfg.name+'-perfmono', **circus_data) }}
