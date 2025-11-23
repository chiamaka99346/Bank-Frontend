# Creating a VPC and EKS cluster using Terraform
# VPC already exists - using existing VPC resources
# module "vpc-deployment" {
#     source = "./module-vpc"
#     
#     environment = var.environment
#     vpc_cidrblock = var.vpc_cidrblock
#     countsub = var.countsub
#     create_subnet = var.create_subnet
#     create_elastic_ip = var.create_elastic_ip
#   
# }

# Existing VPC configuration
locals {
  vpc_id = "vpc-01ac7fdcbf6a16e36"
  public_subnet_ids = [
    "subnet-0834bc70f9ab18ba5",  # production-public-subnet-2-us-east-1b
    "subnet-09ce33beb1918156a"   # production-public-subnet-1-us-east-1a
  ]
  private_subnet_ids = [
    "subnet-025faff4532a4dd42",  # production-private-subnet-1-us-east-1a
    "subnet-03ac0064ede907a0e"   # production-private-subnet-2-us-east-1b
  ]
  private_subnet_db_ids = [
    "subnet-03cf3ff4ec9b82991",  # production-private-subnet-db-1-us-east-1a
    "subnet-0d09f9cd241108ced"   # production-private-subnet-db-2-us-east-1b
  ]
  mysql_security_group_id = "sg-067cea3e8985e73af"  # production-mysql-sg
}

# #creating an EKS cluster using Terraform
# # and deploying it in the VPC created above
module "eks-deployment" {
    source = "./module-eks"
    
    environment = var.environment
    vpc_cidrblock = var.vpc_cidrblock
    countsub = var.countsub
    create_subnet = var.create_subnet
    create_elastic_ip = var.create_elastic_ip
    desired_size = var.desired_size
    max_size = var.max_size
    min_size = var.min_size
    instance_types = var.instance_types
    capacity_type = var.capacity_type
    public_subnet_ids  = local.public_subnet_ids
    private_subnet_ids = local.private_subnet_ids
    cluster_name = var.cluster_name
    repository_name = var.repository_name
    domain-name = var.domain-name
    email = var.email
  
}

# module "namecheap-deployment" {
#     source = "./module-dns"
#     environment = var.environment
#     domain-name = var.domain-name
#     nginx_lb_ip = module.eks-deployment.nginx_lb_ip
#     nginx_ingress_load_balancer_hostname = module.eks-deployment.nginx_ingress_load_balancer_hostname
#     nginx_ingress_lb_dns = module.eks-deployment.nginx_ingress_lb_dns
#   
# }

module "rds-mysql-deployment" {
    source = "./module-database"
    environment = var.environment
    db_instance_class = var.db_instance_class
    db_allocated_storage = var.db_allocated_storage
    private_subnet_db_ids = local.private_subnet_db_ids
    db_name =  var.db_name
    db_password = var.db_password
    db_username = var.db_username
    aws_security_group_ids = local.mysql_security_group_id
}