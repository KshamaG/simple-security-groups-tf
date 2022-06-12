provider "ibm" {
  region           = var.region
  ibmcloud_timeout = 300
}

//security group
resource "ibm_is_security_group" "vpc_security_group" {
  name = "vpc-sg"
  vpc  = var.vpc_id
}

//security group rule to allow ssh all for management
resource "ibm_is_security_group_rule" "vpc_sg_allow_ssh" {
  depends_on = [ibm_is_security_group.vpc_security_group]
  group      = ibm_is_security_group.vpc_security_group.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
}

//security group rule to allow https all for management
resource "ibm_is_security_group_rule" "vpc_sg_rule_in_all" {
  depends_on = [ibm_is_security_group_rule.vpc_sg_allow_ssh]
  group      = ibm_is_security_group.vpc_security_group.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = 443
    port_max = 443
  }
}