resource "openstack_compute_instance_v2" "tradedataprocessing_instance" {
  name              = "tradedataprocessing"
  image_name        = var.image_name
  availability_zone = var.availability_zone
  flavor_name       = var.flavor_name
  key_pair          = var.openstack_keypair
  security_groups   = [openstack_networking_secgroup_v2.tradedataprocessing.id]
  network {
    name = var.network_name
  }

  user_data = file("tradedataprocessing-setup.sh")
}

resource "openstack_compute_floatingip_associate_v2" "ip_assoc" {
  floating_ip = var.floating_ip
  instance_id = openstack_compute_instance_v2.tradedataprocessing_instance.id

  depends_on = [
    openstack_compute_instance_v2.tradedataprocessing_instance
  ]
}
