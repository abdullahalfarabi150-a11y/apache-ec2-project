# Deploy a Custom Apache Web Server on EC2

## 📌 Project Overview
In this project, I deployed a custom web server using Apache on an Amazon EC2 instance running Amazon Linux 2023. The setup was automated using User Data, which installs and configures everything automatically when the instance starts.

---

## 🏗️ Architecture Diagram
```mermaid
flowchart TB
    U[User / Browser] --> I[Internet]
    I --> SG[Security Group (HTTP : 80)]
    SG --> EC2[Amazon EC2 Instance]
    EC2 --> APACHE[Apache Web Server (httpd)]
    APACHE --> WEB[Custom HTML Web Page]
🛠️ Technologies Used
Amazon EC2
Amazon Linux 2023
Apache HTTP Server
Bash scripting (User Data)
AWS Security Groups
⚙️ User Data Script
#!/bin/bash
dnf update -y
dnf install -y httpd

systemctl start httpd
systemctl enable httpd

chown -R ec2-user:ec2-user /var/www/html

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>My Apache Server</title>
</head>
<body>
<h1>Welcome to My Custom Apache Web Server!</h1>
<p>Deployed on AWS EC2 using User Data.</p>
</body>
</html>
EOF

systemctl restart httpd
🚀 Steps Followed
Launched an EC2 instance (Amazon Linux 2023, t2.micro)
Configured Security Group (HTTP & SSH access)
Added User Data script for automation
Accessed the server using public IP
🎯 Result
The EC2 instance was successfully launched
Apache web server was installed and configured automatically
Custom webpage was deployed and accessible via public IP address
