resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.servers.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "${var.project_name}-jenkins"
    Project = var.project_name
    Role    = "Jenkins"
  }
}
resource "aws_instance" "sonarqube" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.servers.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "${var.project_name}-sonarqube"
    Project = var.project_name
    Role    = "SonarQube"
  }
}
resource "aws_instance" "docker" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.servers.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "${var.project_name}-docker"
    Project = var.project_name
    Role    = "Docker-Application"
  }
}
