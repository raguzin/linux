#! /bin/bash
yum install epel-release
yum update
yum install -y nginx
cat <<EOF > /usr/share/nginx/html/index.html
<html><body><h1>Hello World</h1>
<p>This page was created from a simple startup script!</p>
</body></html>
EOF
systemctl start nginx
systemctl enable nginx
