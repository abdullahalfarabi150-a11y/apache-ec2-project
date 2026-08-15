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
