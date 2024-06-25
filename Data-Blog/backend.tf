terraform {
  backend "s3" {
    profile = "tf-user"
    bucket = "mazi-bucket-01"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
    dynamodb_table = "backend.tf"
    
  }
}
resource "aws_instance" "vm" {
  ami = "ami-01bef798938b7644d"
  instance_type = "t2.micro"
  count = 3
  tags = {

   Name = "vm-$(count.index)"

  
}
}