/etc/network/interfaces:
  file.managed:
    - source: salt://interfaces.jinja
    - template: jinja
    - {{ pillar['leaf1'] }}
'sudo ifreload -a':
  cmd.run
