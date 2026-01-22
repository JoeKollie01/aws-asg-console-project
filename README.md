# AWS ASG + ALB (HTTP) Console Project

This repo walks you through building a simple, production-style web setup in AWS using the **Management Console**.

You’ll end up with:
- A **public Application Load Balancer** on **HTTP (port 80)**
- A **Target Group** that the load balancer sends traffic to
- An **Auto Scaling Group** that runs **nginx** on EC2
- EC2 instances placed in **private subnets** (no public IPs)
- **NAT Gateways** in public subnets so private instances can download updates and packages

## Architecture
![Architecture](docs/diagrams/production-arch-http.png)

## What you’re building
- One **VPC** spread across **two Availability Zones** for high availability
- **Public subnets** (one per AZ) that host:
  - the **ALB**
  - the **NAT Gateways**
- **Private subnets** (one per AZ) that host:
  - the **EC2 instances** managed by the ASG
- An **Internet Gateway (IGW)** so public resources can reach the internet
- A **NAT Gateway per AZ** so private instances can make outbound internet requests safely
- Two security groups:
  - **ALB SG**: allows inbound web traffic from anywhere (HTTP 80)
  - **EC2 SG**: allows web traffic only from the ALB (HTTP 80)

## Runbooks (step-by-step)
Follow the guides in `runbooks/` in this order:
1. `01-vpc.md`
2. `02-security-groups.md`
3. `03-target-group.md`
4. `04-alb.md`
5. `05-launch-template.md`
6. `06-asg.md`
7. `07-verify.md`
8. `99-cleanup.md`

## Notes
- This project uses **HTTP only** (no HTTPS).
- It does not include **SSM** or custom **CloudWatch alarms**.
- **NAT Gateways cost money**, so run `99-cleanup.md` when you’re done.
