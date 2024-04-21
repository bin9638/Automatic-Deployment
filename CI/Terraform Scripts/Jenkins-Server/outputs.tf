/*output "ec2_ip" {
  value = [for ec2 in aws_instance.JenkinsServer : ec2.id]
}*/
output "instance_ip" {
  value = aws_instance.JenkinsServer.public_ip
}