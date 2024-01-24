resource "aws_lb" "lb" {
  name               = "Main-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Name = "Main-LB"
  }
}

resource "aws_alb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.id
    type             = "forward"
  }
}