
############### jump server

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  # insert the 2 required variables here
  name="public_bastion_sg"
  description="egress port for all world open"
  vpc_id = module.vpc.vpc_id
  ## ingress rule and cidr block
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #####3 egress rull all-all open
  egress_rules = ["all-all"]
tags = local.common_tags
}
