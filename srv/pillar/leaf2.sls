leaf2:
 loopback: 
  ip: 10.0.0.12/32
  clag_anycast: 10.0.0.112
 swp1: 
  description: THIS IS LEAF2
  ip: 192.168.6.5/24
 swp2: 
  description: to Server02
 swp49:
  description: to Leaf01
 swp50:
  description: to Leaf01
 swp51:
  description: to Spine01
 swp52:
  description: to Spine02
 peerlink:
  address: 169.254.1.2/30
  peerip: 169.254.1.1
  peerbackup: 10.0.0.11
  priority: 200
 bridge:
  ports:
    - peerlink
    - vni13
    - vni24
  vlans:
    - 13
    - 24
 vni13:
  vxlan_id: 13
  vlan_id: 13
  local_ip: 10.0.0.12
 vni24:
  vxlan_id: 24
  vlan_id: 24
  local_ip: 10.0.0.12
 vlan13:
  address: 10.1.3.12/24
  vrr:
    ip: 10.1.3.1/24
    mac: "44:39:39:ff:00:13"
  vlan: 13
 vlan24:
  address: 10.2.4.12/24
  vrr: 
    ip: 10.2.4.1/24
    mac: "44:39:39:ff:00:24"
  vlan: 24
 bgp:
  as: 65011
  neighbors:
    - swp51
    - swp52
    - peerlink.4094
