# AWS Cloud Portfolio — HaniCloudEngineer

## About Me
Transitioning from dentistry into cloud engineering.
Currently studying for AWS Solutions Architect Associate.
Documenting every step of the journey here.

---

## Learning Journey

## Date: Wednesday, May 27, 2026
### Topic: Section 4 — IAM & AWS CLI (21/21 ✅)

### What I learned today:
- Root user = the main account after creation — should never be used daily
- Always create a personal IAM user and use that instead
- MFA should be enabled on both root and IAM user (virtual or physical)
- Policies = JSON documents that grant permissions to users or groups
- Roles = grant permissions to AWS services (e.g., EC2 reading S3, Lambda executing)
- Three ways to access AWS: Console (password), CLI (access key), SDK (access key)
- IAM Credentials Report = overview of all users and their credential status
- Access Advisor = shows which services a user actually accessed

### Progress today:
- Finished Section 4 — 21/21 ✅

---

### Topic: IAM Deep Dive — Policy Evaluation Logic

### Something important I want to highlight:

One thing that really caught my attention today is how
AWS evaluates permissions when there is a conflict.

If a user has two policies at the same time:
- One policy says: Allow access to S3
- Another policy says: Deny access to S3

AWS will always follow the Deny and ignore the Allow.
One explicit Deny blocks access completely,
regardless of how many Allow policies exist.

The order AWS checks:
1. Explicit Deny?  → Yes → Blocked immediately
2. Explicit Allow? → Yes → Access granted
3. Neither?        → Blocked by default

This is called the "Deny Override" rule and it exists
purely for security reasons — so no accidental policy
can ever bypass a security block.

### Why I found this interesting:
It changed how I think about permissions —
instead of asking "do I have access?",
I should first ask "is there anything blocking me?"

---

Date: Thursday, May 28, 2026
Topic: Section 5 — EC2 Fundamentals (17/17 ✅)
Key concepts covered:

EC2 (Elastic Compute Cloud) — virtual server provisioning as Infrastructure as a Service (IaaS)
EC2 instance types — General Purpose, Compute Optimized, Memory Optimized, Storage Optimized
Security Groups — network-level firewall controlling inbound and outbound traffic for EC2 instances
SSH — secure remote access to Linux-based EC2 instances
EC2 purchasing options — On-Demand, Reserved, Spot, Dedicated Hosts

Hands on:

Launched an EC2 instance with a bootstrap script via User Data
Configured Security Group inbound rules for HTTP and SSH access
Established SSH connection to a running EC2 instance from Windows

Progress today:

Finished Section 5 — 17/17 ✅

## Date: Thursday, May 29, 2026
### Topic: Section 6 — EC2 Solutions Architect Level (10/10 ✅)

### What I learned today:

- IPv4 vs IPv6: IPv4 is the standard (e.g. 192.168.1.1),
  IPv6 is newer and handles far more addresses
- Public IP: accessible from the internet, changes on restart
- Private IP: only accessible within the internal network
- Elastic IP: a fixed public IP you reserve — survives instance
  restarts and can be reassigned between instances
- Placement Groups: control how EC2 instances are physically
  placed across AWS hardware
  - Cluster → low latency, same rack (high risk)
  - Spread → each instance on different hardware (high availability)
  - Partition → groups of instances isolated from each other
- ENI (Elastic Network Interface): a virtual network card
  you can attach/detach from instances — useful for failover
- EC2 Hibernate: saves the RAM state to disk so the instance
  resumes exactly where it stopped — faster than a full restart

### Progress today:
- Finished Section 6 — 10/10 ✅
