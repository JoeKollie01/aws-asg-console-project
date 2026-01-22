
```md
# 06-asg.md — Create Auto Scaling Group (Private Subnets)

## Goal
Create an Auto Scaling Group that:
- launches instances using the launch template
- places instances in private subnets (2 AZs)
- attaches instances to the target group
- keeps min/desired/max capacity

## Steps (AWS Console)
1. Open **EC2 Console** → **Auto Scaling Groups**
2. Click **Create Auto Scaling group**
3. Set:
   - **Name**: `simple-asg`
4. Launch template:
   - Select `simple-asg-lt`
5. Network:
   - **VPC**: your project VPC
   - **Subnets**: select **both private subnets**
6. Load balancing:
   - Attach to an existing load balancer
   - Select **Application Load Balancer target groups**
   - Choose `simple-asg-tg`
7. Health checks:
   - Enable **ELB health checks**
   - Grace period: `120` seconds
8. Capacity:
   - **Min**: `2`
   - **Desired**: `2`
   - **Max**: `5`
9. Create the ASG

## Validation
- EC2 Console → Instances: 2 instances launch
- Target group → Targets: instances appear as `initial` then `healthy`
- ASG → Activity: shows successful launches

## Common issues
- Instances in public subnets by mistake: pick private subnets only
- Targets never appear: ASG not attached to the target group, or wrong VPC
- Targets unhealthy: security groups or nginx not running
