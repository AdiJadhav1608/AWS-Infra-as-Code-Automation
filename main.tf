module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.vpc.sg_id]
}
