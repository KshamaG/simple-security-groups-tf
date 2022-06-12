output "vpc_sg_allow_ssh_id" {
  description = "The ID of the security group rule for ssh"
  value       = ibm_is_security_group_rule.vpc_sg_allow_ssh.id
}

output "vpc_sg_rule_in_all_id" {
  description = "The ID of the security group rule for http"
  value       = ibm_is_security_group_rule.vpc_sg_rule_in_all.id
}