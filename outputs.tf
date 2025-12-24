output "app_url" {
  value = "http://${aws_instance.mern_server.public_ip}"
}
