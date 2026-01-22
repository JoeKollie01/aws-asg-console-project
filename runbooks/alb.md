# 04-alb.md — Create Application Load Balancer (HTTP)

## Goal
Create an internet-facing ALB in public subnets that forwards HTTP :80 to the target group.

## Steps (AWS Console)
1. Open **EC2 Console** → **Load Balancers**
2. Click **Create load balancer** → **Application Load Balancer**
3. Configure:
   - **Name**: `simple-asg-alb`
   - **Scheme**: `Internet-facing`
   - **IP address type**: `IPv4`
4. Network mapping:
   - **VPC**: select your project VPC
   - **Mappings**: select **both public subnets** (2 AZs)
5. Security groups:
   - Select `simple-asg-alb-sg`
6. Listeners and routing:
   - Listener: `HTTP :80`
   - Default action: forward to `simple-asg-tg`
7. Click **Create load balancer**
8. Wait for State to become **Active**
9. Copy the **ALB DNS name** (used in verify step)

## Validation
- ALB state: **Active**
- Listener exists: HTTP 80 → forward to target group
- ALB is attached to **public subnets**

## Common issues
- ALB created in private subnets: it must be in public subnets to be internet-facing
- Wrong security group: ALB SG must allow inbound 80 from the internet
