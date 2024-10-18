provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

module "ecs" {
  source = "./modules/ecs"
  name   = "my-ecs-cluster"
}

module "ecr" {
  source = "./modules/ecr"
  name   = "my-sample-app"
}

module "iam" {
  source    = "./modules/iam"
  role_name = "ecsTaskExecutionRole"
}

module "alb" {
  source            = "./modules/alb"
  name              = "app-lb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.vpc.public_subnet_id]
  security_group_id = aws_security_group.lb_sg.id
  target_group_name = "app-tg"
}
