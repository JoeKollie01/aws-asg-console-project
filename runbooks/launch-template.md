# 05-launch-template.md — Create Launch Template (nginx)

## Goal
Create a launch template for ASG instances that:
- uses Amazon Linux
- attaches the EC2 security group
- installs nginx and serves a simple test page

## Steps (AWS Console)
1. Open **EC2 Console** → **Launch Templates**
2. Click **Create launch template**
3. Set:
   - **Launch template name**: `simple-asg-lt`
4. AMI:
   - Choose **Amazon Linux 2023** (or Amazon Linux 2)
5. Instance type:
   - `t3.micro` (or similar)
6. Key pair:
   - Optional (instances are private, SSH won’t work without extra networking)
7. Network settings:
   - Security group: `simple-asg-ec2-sg`
8. Advanced details → **User data**:

```bash
#!/bin/bash
set -euxo pipefail
dnf -y update || true
dnf -y install nginx || yum -y install nginx
echo "<h1>ASG is working</h1>" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx
