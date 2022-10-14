module "ec2" {
  source            = "./modules/ec2"
  availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]
  key_name          = "terraform-key"
  subnet_id = "subnet-08c7792cccfa4a4db"
  #subnet_id         = module.vpc.publicsubnet[1].id
  vpc_id            = "${module.vpc.vpc}"
  instance_type     = "t2.micro"
}
