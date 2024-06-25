# data "aws_ami" "amazon" {
#     most_recent = true
#     owners = ["amazon"]
  



# filter {
#     name = "name"
#     values = ["al2023-ami-2023.*-x86_64"]
# }
# filter {
#     name = "virtualization-type"
#     values = ["hvm"]
# }
#  filter {
#     name = "root-device-type"
#     values = ["ebs"]
# }
# }
# resource "aws_instance" "vm" {
#   ami = data.aws_ami.amazon.id
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Data-Blog-Server"
#   }
  
# }
# output "ami_id" {
#     value = data.aws_ami.amazon.id
  
# }