module "ec2" { 
   source = "./ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    instance_name = var.instance_name
    subnet_id = var.subnet_id
  
}
module "vpc" {
    source = "./vpc"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_name = var.vpc_name
    subnet_cidr_block = var.subnet_cidr_block
    subnet_az = var.subnet_az
    map_public_ip = var.map_public_ip
    subnet_name = var.subnet_name
    igw_name = var.igw_name
    sg_port = var.sg_port
  
}
