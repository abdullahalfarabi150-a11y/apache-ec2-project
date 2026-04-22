# apache-ec2-project
Set up a custom Apache HTTP Server on Amazon EC2 to host a website in the cloud, covering basic setup, configuration, and deployment on Amazon Web Services. Also learned how to launch an instance, install Apache, and serve your first web page.
# Deploy a Custom Apache Web Server on EC2

## 📌 Project Overview
In this project, I deployed a custom web server using Apache on an Amazon EC2 instance running Amazon Linux 2023. The setup was automated using User Data, allowing the server and a custom webpage to be configured automatically at launch.

## 🚀 What I Did
- Launched an EC2 instance on AWS
- Configured security groups to allow HTTP and SSH access
- Installed and started Apache (httpd)
- Automated setup using EC2 User Data
- Deployed a custom-designed HTML webpage

## 🛠️ Technologies Used
- Amazon EC2  
- Amazon Linux 2023  
- Apache (httpd)  
- Bash scripting (User Data)

## ⚙️ Setup Instructions

### 1. Launch EC2 Instance
- AMI: Amazon Linux 2023  
- Instance Type: t2.micro  
- Enabled Auto-assign Public IP  
- Configured Security Group:
  - HTTP (80) – Anywhere  
  - SSH (22) – My IP  

### 2. User Data Script
```bash
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
## ✅ Result
The EC2 instance successfully hosted a custom Apache web server, and the webpage was accessible via the public IP address.
