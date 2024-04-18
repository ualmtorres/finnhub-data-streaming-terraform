# Create tradedataprocessing security group
resource "openstack_networking_secgroup_v2" "tradedataprocessing" {
  name        = "tradedataprocessing"
  description = "data processing security group"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  description       = "SSH"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 22
  port_range_min    = 22
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "https" {
  description       = "HTTPS"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 443
  port_range_min    = 443
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "kafdrop" {
  description       = "kafdrop"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 19000
  port_range_min    = 19000
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "cassandraweb" {
  description       = "cassandraweb"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 4000
  port_range_min    = 4000
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "grafana" {
  description       = "grafana"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 3000
  port_range_min    = 3000
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "sparkcluster" {
  description       = "sparkcluster"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 8080
  port_range_min    = 8082
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "cassandra" {
  description       = "cassandra"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 9042
  port_range_min    = 9042
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "kafka" {
  description       = "kafka"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 29092
  port_range_min    = 29094
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}

resource "openstack_networking_secgroup_rule_v2" "spark" {
  description       = "spark"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max    = 7077
  port_range_min    = 7077
  security_group_id = openstack_networking_secgroup_v2.tradedataprocessing.id
}
