
# Network module - Development

module "dev_network" {
  source = "./modules/network"

  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"

  public_az  = var.public_az
  private_az = var.private_az

  project_tags = var.project_tags
}

# EC2 Instance

resource "aws_instance" "ec2" {
  ami                         = "ami-0593d733c2fc5bd2e"
  instance_type               = var.aws_instance_type
  subnet_id                   = module.dev_network.public_subnet_id
  vpc_security_group_ids      = [module.dev_network.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    set -e
    #This is nginx server
    dnf update -y
    dnf install nginx -y
    systemctl enable nginx
    systemctl start nginx
  EOF

  tags = merge(var.project_tags, {
    Name = "devops-web-server"
  })
}


# Network module - Staging

module "staging_network" {
  source = "./modules/network"

  vpc_cidr            = "10.1.0.0/16"
  public_subnet_cidr  = "10.1.1.0/24"
  private_subnet_cidr = "10.1.2.0/24"

  public_az  = var.public_az
  private_az = var.private_az

  project_tags = var.project_tags
}


