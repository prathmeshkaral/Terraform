resource "aws_instance" "vm" {
    ami = "ami-061a125c7c02edb39"
    instance_type = "t2.micro"
    key_name = "Three-tier"
    subnet_id = "subnet-094bbf0a27388c62a"
    security_groups = [ aws_security_group.sg.id ]
    tags = {
      Name = "Tomcat-Server"
    }
  user_data = <<-EOF
            #!/bin/bash
            exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
            sudo yum install java-11* -y
            sudo wget -P /home/ec2-user https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
            sudo chmod 774 /home/ec2-user/apache-tomcat-8.5.100.tar.gz
            sudo tar -xzf /home/ec2-user/apache-tomcat-8.5.100.tar.gz -C /opt
            sudo cd /opt/apache-tomcat-8.5.100/webapps/
            sudo wget -P /opt/apache-tomcat-8.5.100/webapps/ https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
            sudo cd ../lib
            sudo wget -P /opt/apache-tomcat-8.5.100/lib/ https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
            sudo cd ../bin
            sudo bash /opt/apache-tomcat-8.5.100/bin/catalina.sh start
            EOF

}

             
resource "aws_security_group" "sg" {
    name = "tomcat-sg"
    vpc_id = "vpc-08c67812832d78336"

  
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.sg.id
    from_port =22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
  
}
resource "aws_vpc_security_group_ingress_rule" "http" {
    security_group_id = aws_security_group.sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
  
}
resource "aws_vpc_security_group_ingress_rule" "tomcat" {
    security_group_id = aws_security_group.sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 8080
    to_port = 8080
    ip_protocol = "tcp"
  
}
resource "aws_vpc_security_group_egress_rule" "outbound" {
    security_group_id = aws_security_group.sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 0
    to_port = 0
    ip_protocol = "-1"
  
}