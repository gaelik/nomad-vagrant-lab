data_dir = "/tmp/nomad/server"

datacenter = "vancouver"

region = "west"

advertise {
  http = "{{ GetInterfaceIP `eth1` }}"
  rpc  = "{{ GetInterfaceIP `eth1` }}"
  serf = "{{ GetInterfaceIP `eth1` }}"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled           = true
  network_interface = "eth1"
  servers           = ["172.16.1.201", "172.16.1.202", "172.16.1.203"]
}
