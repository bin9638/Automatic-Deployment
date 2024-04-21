resource "aws_instance" "QAServer" {
  ami                    = "ami-09c8d5d747253fb7a" # ID của AMI bạn muốn sử dụng
  instance_type          = var.my_instance_type         # Loại instance
  key_name               = var.my_key
  vpc_security_group_ids = [aws_security_group.web-traffic.id]
  tags = {
    Name = "QA-Server" # Tên của instance
  }
  /* provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java",                                                              # Cài đặt Java
      "sudo yum install -y wget",                                                              # Cài đặt wget
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo", # Thêm Jenkins repository
      "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",                        # Thêm khóa GPG cho Jenkins
      "sudo yum install -y jenkins",                                                           # Cài đặt Jenkins
      "sudo systemctl start jenkins",                                                          # Khởi động Jenkins
      "sudo systemctl enable jenkins"                                                          # Kích hoạt Jenkins khởi động cùng hệ thống
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"                    # Tài khoản SSH được sử dụng
    private_key = file("/D/my-key/") # Đường dẫn tới khóa SSH
    host        = self.public_ip                # Địa chỉ IP công cộng của instance
  }*/
}