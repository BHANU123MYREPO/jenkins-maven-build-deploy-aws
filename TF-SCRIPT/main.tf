# main.tf


module "ec2_instances" {
  source = "./modules/ec2-module"

  instance_count   = 3
  instance_types    = ["t2.micro", "t2.micro", "t2.medium"]
  ami              = "ami-05c0f5389589545b7"  # Specify the desired AMI
  key_name         = "demo-key" # Specify your SSH key pair name
  subnet_id        = "subnet-0e41453c9b1028803"  # Specify the subnet ID where instances will be launched
  security_group_ids = ["sg-028f18c61a04ac090"]  # Specify security group IDs

  tags = [
    {
      Terraform   = "true"
      Environment = "dev"
      Name        = "Jenkins-Master"
    },
    {
      Terraform   = "true"
      Environment = "dev"
      Name        = "Jenkins-Slave"
    },
    {
      Terraform   = "true"
      Environment = "prod"
      Name        = "Deployer"
    }
  ]
}
