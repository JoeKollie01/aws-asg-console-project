# 03-target-group.md — Create Target Group (Instances)

## Goal
Create a target group for the ALB to send traffic to, and for the ASG to register instances into automatically.

## Steps (AWS Console)
1. Open **EC2 Console** → **Target Groups**
2. Click **Create target group**
3. Choose:
   - **Target type**: `Instances`
   - **Name**: `simple-asg-tg`
   - **Protocol**: `HTTP`
   - **Port**: `80`
   - **VPC**: select your project VPC
4. Health checks:
   - Protocol: `HTTP`
   - Path: `/`
5. Click **Create target group**

Notes:
- You do not need to manually register targets.
- When the ASG launches instances, it will register them into this target group.

## Validation
- Target group exists and shows:
  - Protocol/Port: HTTP:80
  - Health check path: `/`
- Targets tab may be empty until the ASG is created and instances launch

## Common issues
- Wrong VPC: must match the VPC where your ASG instances will run
- Health check path mismatch: keep `/` unless your app serves a different path
