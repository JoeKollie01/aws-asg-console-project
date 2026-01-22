# 01-vpc.md — Create VPC (Public + Private Subnets + NAT)

## Goal
Create a VPC across 2 Availability Zones with:
- 2 public subnets (for ALB + NAT)
- 2 private subnets (for ASG EC2)
- Internet Gateway (IGW)
- NAT Gateway in each AZ (for outbound access from private subnets)

## Steps (AWS Console)
1. Open **VPC Console**
2. Click **Create VPC** → select **VPC and more**
3. Set:
   - **Name tag auto-generation**: `simple-asg-http`
   - **IPv4 CIDR block**: `10.10.0.0/16`
   - **Number of Availability Zones**: `2`
   - **Public subnets**: `2`
   - **Private subnets**: `2`
   - **NAT gateways**: `1 per AZ`
   - **VPC endpoints**: `None`
4. Click **Create VPC**

## Confirm VPC DNS settings
1. VPC Console → **Your VPCs** → select your VPC
2. **Actions** → **Edit VPC settings**
3. Ensure both are **enabled**:
   - **DNS hostnames**
   - **DNS resolution**
4. Save changes (if needed)

## Validation
- VPC Console → Subnets: you should see **4 subnets** (2 public, 2 private)
- VPC Console → NAT Gateways: you should see **2 NAT gateways** (one in each public subnet)
- VPC Console → Route tables:
  - Public route table has `0.0.0.0/0 → Internet Gateway`
  - Private route tables have `0.0.0.0/0 → NAT Gateway`

## Common issues
- NAT gateways cost money. Delete them in cleanup if this is a lab.
- If instances later cannot install packages, NAT routing is usually the cause.
