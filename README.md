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

## Monitoring & Alerting:
After successfully deploying the Apache web server, I extended the project by implementing Amazon CloudWatch monitoring and Amazon SNS email alerting.

### 1. CloudWatch Monitoring
Amazon CloudWatch was configured to monitor the EC2 instance's CPU Utilization metric. A CloudWatch Alarm was created to detect sustained high CPU utilization.

Alarm Configuration:

- Metric: CPU Utilization
- Period: 5 minutes
- Datapoints to alarm: 1 out of 1
- Alarm action: Send notification through Amazon SNS

The 1 out of 1 configuration means CloudWatch evaluates three consecutive 5 minute periods. The alarm enters the ALARM state when the configured CPU condition is met across the required evaluation periods.

### 2. SNS Email Alerting
Amazon SNS was integrated with the CloudWatch Alarm to provide email notifications.

The configuration included:

- Creating an SNS topic
- Adding an email subscription
- Confirming the email subscription
- Connecting the SNS topic to the CloudWatch Alarm

When the alarm condition is met, CloudWatch changes the alarm to the ALARM state and sends a notification through SNS.

### 3. Monitoring Test
The monitoring system was tested by generating CPU load on the EC2 instance using:

yes > /dev/null &

This increased CPU utilization and allowed the CloudWatch Alarm to be tested.

After testing, the CPU-intensive process was stopped using:

pkill yes

The test demonstrated the complete monitoring and alerting workflow:

EC2 → CloudWatch → CloudWatch Alarm → SNS → Email Notification

## Screenshots:

### 1. EC2 Instance Dashboard
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/423001b900f55ec2ad4ff1d0b7cf881463e323cf/ec2-instance-dashboard.png)

Shows the running Amazon EC2 instance and its key configuration used to host the Apache web server.

### 2. Security Group Configuration
![image alt](https://github.com/abdullahalfarabi150-a11y/apache-ec2-project/blob/e960261385394650989f73954a80ce71691c0496/Security-group-config.png)

Shows the network access rules configured to securely manage the instance through SSH and provide public HTTP access.

### 3. Final Website Output
![image alt]
