resource "aws_security_group" "ssh" {
    vpc_id = "vpc-08c67812832d78336"
    name = "provision-sg"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
  
  resource "aws_instance" "provisioner" {
    ami = "ami-061a125c7c02edb39"
    instance_type = "t2.micro"
    key_name = "Three-tier"
    subnet_id = "subnet-094bbf0a27388c62a"
    security_groups = [aws_security_group.ssh.id]
 
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("Three-tier")
    host = self.public_ip

      }
  
provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"

}
provisioner "local-exec" {
    command = "touch /tmp/Demo.txt"

}
provisioner "remote-exec" {
    inline = [ "sudo yum install nginx -y", "sudo systemctl start nginx", "sudo systemctl enable nginx"]

}

  }
  output "public_ip" {
    value = aws_instance.provisioner.public_ip
    
  }