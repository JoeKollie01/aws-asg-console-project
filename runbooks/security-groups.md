# 02-security-groups.md — Create Security Groups (ALB + EC2)

## Goal
Create 2 security groups:
- ALB SG: allow inbound HTTP :80 from the internet
- EC2 SG: allow inbound HTTP :80 only from the ALB SG

## Steps (AWS Console)

### A) Create ALB security group
1. Open **EC2 Console** → **Security Groups**
2. Click **Create security group**
3. Set:
   - **Name**: `simple-asg-alb-sg`
   - **VPC**: select your project VPC
4. Inbound rules:
   - **HTTP**, port **80**, source `0.0.0.0/0`
5. Outbound rules:
   - Leave default (**All traffic** allowed)
6. Create security group

### B) Create EC2 security group
1. Click **Create security group**
2. Set:
   - **Name**: `simple-asg-ec2-sg`
   - **VPC**: same project VPC
3. Inbound rules:
   - **HTTP**, port **80**
   - Source type: **Security group**
   - Source: `simple-asg-alb-sg`
   - If the name does not appear, paste the **ALB SG ID** (looks like `sg-...`)
4. Outbound rules:
   - Leave default (**All traffic** allowed)
5. Create security group

## Validation
- Both SGs show the same **VPC ID**
- `simple-asg-alb-sg` inbound: `80 from 0.0.0.0/0`
- `simple-asg-ec2-sg` inbound: `80 from simple-asg-alb-sg`

## Common issues
- SG dropdown not showing a name: paste the `sg-...` ID instead
- Wrong SG edited: the “source = ALB SG” rule belongs on the **EC2 SG**
- Region mismatch: SGs are regional
