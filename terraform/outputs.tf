output "ecr_repository_url" {
  value = aws_ecr_repository.my_app_ecr.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_ecs_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.my_ecs_service.name
}
