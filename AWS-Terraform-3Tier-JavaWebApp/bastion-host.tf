resource "aws_instance" "vprofile-bastion" {
  ami                    = lookup(var.amis, var.region)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.vprofilekey.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.vprofile-bastion-sg.id]
  user_data              = templatefile("templates/db-deploy.sh", { rds-endpoint = aws_db_instance.vprofile-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })

  tags = {
    Name    = "vprofile-bastion"
    Project = "vprofile"
  }

  depends_on = [aws_db_instance.vprofile-rds]
}
