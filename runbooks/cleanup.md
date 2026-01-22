# 99-cleanup.md — Delete Resources (Avoid Charges)

## Goal
Remove all resources created for this project.
Important: NAT Gateways and ALB incur ongoing charges.

## Delete in this order

### 1) Auto Scaling Group
1. EC2 Console → **Auto Scaling Groups** → select `simple-asg`
2. Edit:
   - Min: `0`
   - Desired: `0`
3. Save and wait for instances to terminate
4. Delete the Auto Scaling Group

### 2) Load Balancer
1. EC2 Console → **Load Balancers**
2. Select `simple-asg-alb` → **Delete**

### 3) Target Group
1. EC2 Console → **Target Groups**
2. Select `simple-asg-tg` → **Delete**

### 4) Launch Template (optional)
1. EC2 Console → **Launch Templates**
2. Delete `simple-asg-lt` (optional)

### 5) NAT Gateways (important)
1. VPC Console → **NAT Gateways**
2. Delete both NAT gateways
3. Wait for deletion to complete

### 6) VPC
1. VPC Console → **Your VPCs**
2. Select the project VPC → **Delete VPC**
   - If it fails, check for leftover dependencies (NAT, ENIs, ALB, etc.)

## Final validation
- EC2 instances: none left from this project
- Load balancers: deleted
- NAT gateways: deleted
- VPC: deleted (if it was created solely for this lab)

## Common issues
- VPC delete fails: NAT gateways or ENIs are still deleting. Wait a few minutes and retry.
