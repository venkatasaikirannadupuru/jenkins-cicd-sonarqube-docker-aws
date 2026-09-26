output "jenkins_public_ip" {
  description = "Public IP address of Jenkins EC2"
  value       = aws_instance.jenkins.public_ip
}

output "sonarqube_public_ip" {
  description = "Public IP address of SonarQube EC2"
  value       = aws_instance.sonarqube.public_ip
}

output "docker_public_ip" {
  description = "Public IP address of Docker/Application EC2"
  value       = aws_instance.docker.public_ip
}

output "jenkins_url" {
  description = "Jenkins web interface"
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "sonarqube_url" {
  description = "SonarQube web interface"
  value       = "http://${aws_instance.sonarqube.public_ip}:9000"
}

output "application_url" {
  description = "Docker application"
  value       = "http://${aws_instance.docker.public_ip}"
}