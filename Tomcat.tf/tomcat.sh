
# #!/bin/bash
# exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
# sudo yum install java-11* -y
# sudo wget -P /home/ec2-user https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
# sudo chmod 774 /home/ec2-user/apache-tomcat-8.5.100.tar.gz
# sudo tar -xzf /home/ec2-user/apache-tomcat-8.5.100.tar.gz -C /opt
# sudo cd /opt/apache-tomcat-8.5.100/webapps/
# sudo wget -P /opt/apache-tomcat-8.5.100/webapps/ https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
# sudo cd ../lib
# sudo wget -P /opt/apache-tomcat-8.5.100/lib/ https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
# sudo cd ../bin
# sudo bash /opt/apache-tomcat-8.5.100/bin/catalina.sh start
