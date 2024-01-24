resource "aws_ecs_service" "ECS-Service" {
  name                               = "Service"
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.ECS.id
  task_definition                    = aws_ecs_task_definition.td.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  depends_on                         = [aws_alb_listener.listener, aws_iam_role.iam-role]

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "main-container"
    container_port   = 80
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = module.vpc.public_subnets
  }
}