/etc/network/interfaces:
  file.managed:
    - source: salt://interfaces.jinja
    - template: jinja
    - {{ pillar['leaf1'] }}
