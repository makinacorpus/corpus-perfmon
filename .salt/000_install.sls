{% set cfg = opts['ms_project'] %}
{% set data = cfg.data %}
include:
  - makina-states.localsettings.jdk
download:
  archive.extracted:
    - unless: "{{cfg.project_root}}/p/startAgent.sh --help"
    - source: "{{data.url}}"
    - name: "{{cfg.project_root}}/p"
    - archive_format: zip
    - source_hash: "{{data.hash}}"
