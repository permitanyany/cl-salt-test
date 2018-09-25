{# If switch failed to authenticate -- remove accepted key #}
{% if not data['result'] and data['id'].startswith('leaf') %}
minion_remove:
  wheel.key.delete:
    - match: {{ data['id'] }}
minion_rejoin:
  local.cmd.run:
    - tgt: salt-master.domain.tld
    - args:
      - cmd: ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no cumulus@"{{ data['id'] }}" 'sudo sleep 10 && /etc/init.d/salt-minion restart'
{% endif %}

{# If switch is sending a new key -- accept this key #}
{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('leaf') %}
minion_add:
  wheel.key.accept:
    - match: {{ data['id'] }}
{% endif %}
