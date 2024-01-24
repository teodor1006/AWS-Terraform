resource "aws_lb_target_group" "tg" {
  name        = "Main-TG"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Main-TG"
  }
}