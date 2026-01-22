# 07-verify.md — Verify End-to-End Traffic

## Goal
Confirm the ALB can reach healthy instances and serve the nginx page.

## Verify targets are healthy
1. EC2 Console → **Target Groups** → `simple-asg-tg`
2. Open **Targets** tab
3. Confirm all instances show **Healthy**

If not healthy:
- Confirm EC2 SG inbound: 80 from ALB SG
- Confirm nginx installed/started (user data)
- Confirm health check path is `/`

## Verify in browser
1. EC2 Console → **Load Balancers** → `simple-asg-alb`
2. Copy **DNS name**
3. Open:
   - `http://<ALB-DNS-NAME>`
4. Expect to see:
   - `ASG is working`

## Demonstrate scaling (manual)
1. EC2 Console → Auto Scaling Groups → `simple-asg`
2. Edit group size:
   - Desired: change from `2` to `3` (or `4`)
3. Save
4. Watch:
   - ASG **Activity** tab for new instance launches
   - Target group **Targets** tab for new healthy targets
5. Scale back down:
   - Set Desired back to `2`

## Common issues
- ALB DNS doesn’t load: ALB not active, wrong subnets, or ALB SG inbound missing
- Only some instances healthy: usually user data timing or security group mismatch
