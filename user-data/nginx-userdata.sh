cat > user-data/nginx-userdata.sh <<'EOF'
#!/bin/bash
set -euxo pipefail
dnf -y update || true
dnf -y install nginx || yum -y install nginx
echo "<h1>ASG is working</h1>" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx
EOF
