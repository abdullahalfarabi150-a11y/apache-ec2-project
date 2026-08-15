# Deploy and Monitor a Custom Apache Web Server on AWS EC2

##  Project Overview:
This project demonstrates the deployment, automation, monitoring, and alerting of a custom Apache web server on Amazon EC2.

I used Amazon Linux 2023 and automated the Apache installation and website deployment using EC2 User Data. I then implemented Amazon CloudWatch to monitor CPU utilization and configured a CloudWatch Alarm with Amazon SNS to send email notifications when sustained high CPU utilization was detected.

##  Architecture Flow:

User → Internet → EC2 → Apache → Custom HTML Website

EC2 CPU Utilization → CloudWatch → CloudWatch Alarm → SNS → Email Notification

This architecture demonstrates a basic AWS cloud environment combining compute, web hosting, automation, monitoring, and automated alerting.

##  Technologies & Services Used:
AWS Services
- Amazon EC2 
- Amazon CloudWatch 
- Amazon SNS 
- AWS Security Groups 
- EC2 User Data

Operating System & Web Server
- Amazon Linux 2023 
- Apache HTTP Server

Programming & Tools
- Bash / Shell Scripting 
- HTML 
- SSH

##  Deployment & Configuration:

### 1. EC2 Instance Deployment
An Amazon EC2 instance was launched using Amazon Linux 2023 with a t3.micro instance type and a public IPv4 address enabled.

A Security Group was configured to allow:

HTTP (Port 80) from anywhere for public website access.
SSH (Port 22) from my IP address for secure remote administration.

### 2. Automated Apache Deployment
EC2 User Data was used to automate the initial server configuration.

During the instance launch process, the Bash script automatically:

- Updated the operating system packages
- Installed the Apache HTTP Server (httpd)
- Started the Apache service
- Enabled Apache to start automatically after reboot
- Configured permissions for the web directory
- Created and deployed the initial HTML webpage

This automated the initial web server setup without requiring manual Apache installation after connecting to the instance.

### 3. Custom Webpage
The initial webpage was deployed automatically through the User Data script. After verifying that the Apache server was working successfully, I updated and redesigned the webpage to create a more customized final website for the project. 

The final webpage is hosted at:

/var/www/html/index.html

The website was accessed through the EC2 instance's public IPv4 address.

## User Data Script:

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
Note: The User Data script created the initial webpage during EC2 deployment. After confirming the deployment was successful, I later modified the HTML file to create the final customized webpage.

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
