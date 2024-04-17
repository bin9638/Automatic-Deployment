resource "aws_instance" "JenkinsServer" {
  ami = data.aws_ami.amazonlinux2 # ID của AMI bạn muốn sử dụng
  instance_type = var.my_instance_type     # Loại instance
  key_name = var.my_key
  vpc_security_group_ids = [aws_security_group.web-traffic.id]
  tags = {
    Name = "Jenkins-Server"       # Tên của instance
  }
}