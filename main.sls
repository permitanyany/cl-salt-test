/etc/network/interfaces:
  file.managed:
    - source: salt://interfaces.jinja
    - template: jinja
    - {{ pillar[salt['grains.get']('id')] }}

/etc/frr/frr.conf:
  file.managed:
    - source: salt://frr.jinja
    - template: jinja
    - {{ pillar[salt['grains.get']('id')] }}

'sudo ifreload -a':
  cmd.run

/etc/frr/daemons:
  file.managed:
    - source: salt://daemons

frr:
  service.running:
    - restart: True
    - watch:
      - file: /etc/frr/frr.conf
      - file: /etc/frr/daemons
