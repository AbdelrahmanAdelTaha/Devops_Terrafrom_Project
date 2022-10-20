module "network" {
  source               = "./network"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr

}

module "lambda_connect" {
  source = "./lambda"
}
