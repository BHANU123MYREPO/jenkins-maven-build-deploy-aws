# modules/ec2-module/main.tf

resource "aws_instance" "ec2_instances" {
  count = var.instance_count

  ami             = var.ami
  instance_type   = var.instance_types[count.index]
  key_name        = var.key_name

  subnet_id       = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true

  tags = merge(
    {
      "Name"        = "Instance-${count.index + 1}"
      "Environment" = var.tags[count.index]["Environment"]
    },
    var.tags[count.index]
  )
}
