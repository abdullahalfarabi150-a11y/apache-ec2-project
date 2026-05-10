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
```

Result:
- The EC2 instance was successfully launched
- Apache web server was installed and configured automatically
- Custom webpage was deployed and accessible via public IP address

## 📸 Screenshots

### 1. User Data Script
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/6396d33e3722a77f5da9aa3137aa63a9ed9bf038/user-data-script.png)

* This script automates the entire Apache web server setup on launch.
* Instead of manually SSHing into the instance, I used a User Data bash
* script to install Apache, start the service, enable it on reboot, and
* deploy a custom HTML page — all automatically when EC2 first boots.

### 2. EC2 Instance Dashboard
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/423001b900f55ec2ad4ff1d0b7cf881463e323cf/ec2-instance-dashboard.png)

This shows the AWS EC2 instance used to host the Apache web server.

* Displays the running EC2 instance status
* Shows instance type and configuration details
* Shows public IP address used to access the server
* Confirms successful instance launch on AWS

### 3. Security Group Configuration
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/e960261385394650989f73954a80ce71691c0496/Security-group-config.png)

This defines network access rules for the EC2 instance.

* Allows SSH access on port 22 for remote login
* Enables HTTP traffic on port 80 for web access
* Optionally allows HTTPS traffic on port 443
* Controls inbound traffic for security of the server

### 4. Final Website Output
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/4319c4832794c8d1db76efb774618d359aa2a88c/final-website-output.png)

The image confirms that the Apache web server is successfully hosting the website on an AWS EC2 instance.

* Custom HTML page deployed on EC2
* Website accessed using the EC2 Public IP address
* Apache Web Server configured and running successfully
* Verified successful end-to-end deployment using User Data
