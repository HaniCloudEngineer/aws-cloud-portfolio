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

- ## Date: saturday, May 30, 2026
### Topic: Section 7 — EC2 Instance Storage (16/16 ✅)

### What I learned today:

- EBS (Elastic Block Store): a network drive you attach to
  your EC2 instance — persists data even after instance stops
  - Locked to one Availability Zone
  - Can take snapshots and move them across regions
- EBS Snapshots: a backup of your EBS volume at a point in time
  - Can copy snapshots to another region for disaster recovery
- AMI (Amazon Machine Image): a custom image of your instance
  - You can build your own AMI with pre-installed software
  - Faster launch time than installing everything from scratch
- EC2 Instance Store: physical storage attached directly to
  the host machine — extremely fast but data is lost on stop
  - Use for temporary data only, not for long-term storage
- EBS Volume Types:
  - gp2/gp3 → general purpose SSD (most common)
  - io1/io2 → high performance SSD (databases)
  - st1 → throughput HDD (big data)
  - sc1 → cold HDD (infrequent access)
- EBS Multi-Attach: attach one EBS volume to multiple
  instances at the same time (io1/io2 only)
- EBS Encryption: encrypts data at rest and in transit
  — minimal performance impact
- Amazon EFS (Elastic File System): a shared network file
  system — multiple instances can access it simultaneously
  - Works across multiple Availability Zones
- EFS vs EBS:
  - EBS → one instance, one AZ
  - EFS → many instances, many AZs, higher cost

### Progress today:
- Finished Section 7 — 16/16 ✅

- ## Date: Sunday, May 31, 2026
### Topic: Section 8 — High Availability, ELB & ASG (18/18 ✅)

### What I learned today:

- High Availability vs Scalability:
  - Scalability → handle more load (vertical = bigger instance,
    horizontal = more instances)
  - High Availability → survive a data center failure
    (run in multiple AZs)

- ELB (Elastic Load Balancer): distributes traffic across
  multiple EC2 instances automatically
  - Managed by AWS — no maintenance required

- Types of Load Balancers:
  - ALB (Application) → HTTP/HTTPS, routes by URL/path,
    best for web apps
  - NLB (Network) → ultra-high performance, TCP/UDP,
    handles millions of requests per second
  - GWLB (Gateway) → routes traffic through
    third-party security appliances

- Sticky Sessions: locks a user to the same instance
  — useful when session data is stored locally

- Cross-Zone Load Balancing: distributes traffic evenly
  across all instances in all AZs

- SSL Certificates: encrypt traffic between client and
  load balancer (HTTPS)

- Connection Draining: gives existing connections time
  to complete before removing an instance

- ASG (Auto Scaling Group): automatically adds or removes
  EC2 instances based on load
  - Scale out → add instances
  - Scale in → remove instances
  - Scaling Policies: target tracking, step scaling,
    scheduled scaling

### Progress today:
- Finished Section 8 — 18/18 ✅

 ## Date: Monday, June 1, 2026
### Topic: Section 9 — RDS, Aurora & ElastiCache (16/16 ✅)

### What I learned today:

- RDS (Relational Database Service): managed SQL database
  service — supports MySQL, PostgreSQL, Oracle, SQL Server
  - AWS handles backups, patching, and maintenance
  - Cannot SSH into the instance

- RDS Read Replicas vs Multi-AZ:
  - Read Replicas → improve read performance,
    can be in different regions
  - Multi-AZ → disaster recovery only,
    standby instance takes over automatically on failure

- RDS Custom: gives you access to the underlying OS
  — only for Oracle and SQL Server

- Amazon Aurora: AWS proprietary database
  - Compatible with MySQL and PostgreSQL
  - 5x faster than MySQL, 3x faster than PostgreSQL
  - Storage auto-scales up to 128TB
  - High availability built-in across 3 AZs

- RDS & Aurora Backup:
  - Automated backups — point in time recovery
  - Manual snapshots — kept as long as you want

- RDS Security:
  - Encryption at rest and in transit
  - IAM authentication supported
  - Security Groups control network access

- RDS Proxy: sits between app and database
  - Reduces database connections
  - Improves failover time by up to 66%

- ElastiCache: managed in-memory database
  - Redis → supports persistence, replication, backups
  - Memcached → pure cache, no persistence, simpler
  - Used to reduce database load for read-heavy workloads

- List of Ports to know:
  - MySQL/Aurora → 3306
  - PostgreSQL → 5432
  - Oracle → 1521
  - MSSQL → 1433

### Progress today:
- Finished Section 9 — 16/16 ✅

- ## Date: Tuesday, June 2, 2026
### Topic: Section 10 — Route 53 (21/21 ✅)

### What I learned today:

- DNS (Domain Name System): translates domain names
  into IP addresses — like a phone book for the internet

- Route 53: AWS managed DNS service
  - Can register domains directly through AWS
  - Routes users to the closest or healthiest endpoint

- TTL (Time To Live): how long a DNS record is cached
  - High TTL → less queries, but slower updates
  - Low TTL → more queries, but faster updates

- CNAME vs Alias:
  - CNAME → points a domain to another domain,
    cannot be used on root domain (e.g. example.com)
  - Alias → AWS specific, works on root domain,
    free of charge, supports AWS resources directly

- Routing Policies:
  - Simple → single resource, no health checks
  - Weighted → split traffic by percentage
    (e.g. 70% to v1, 30% to v2)
  - Latency → routes to the region with lowest latency
  - Failover → primary and secondary instance,
    switches automatically if primary fails
  - Geolocation → routes based on user's country/region
  - Geoproximity → routes based on geographic distance,
    can shift traffic with a bias value
  - IP-based → routes based on user's IP address
  - Multi Value → returns multiple healthy records,
    not a substitute for a load balancer

- Health Checks: monitors endpoint availability
  - Can trigger failover automatically
  - Can monitor other health checks (calculated)

- 3rd Party Domains: you can buy a domain elsewhere
  and point it to Route 53 nameservers

- Route 53 Resolvers & Hybrid DNS:
  - Inbound Resolver → allows on-premises to query Route 53
  - Outbound Resolver → allows Route 53 to query on-premises

### Progress today:
- Finished Section 10 — 21/21 ✅

- ## Date: Wednesday, June 3, 2026
### Topic: Section 11 — Classic Solutions Architecture (8/8 ✅)

### What I learned today:

- This section was different — instead of learning new services,
  it combined everything learned so far into real-world scenarios.
  This is exactly how the exam thinks.

- WhatsTheTime.com scenario:
  - Started with a single EC2 instance
  - Added Elastic IP → then Route 53
  - Added Auto Scaling Group + Load Balancer
  - Lesson: always design for scalability from the start

- MyClothes.com scenario:
  - Stateful web app — needed to handle user sessions
  - Used ElastiCache to store session data
  - Used RDS for the database with Read Replicas
  - Lesson: separate state from the application layer

- MyWordPress.com scenario:
  - Needed shared storage across multiple instances
  - Used EFS to share files across all EC2 instances
  - Lesson: EFS when multiple instances need the same files

- Instantiating Applications Quickly:
  - EC2: use Golden AMI (pre-installed software)
  - RDS: restore from snapshot instead of rebuilding
  - EBS: restore from snapshot for faster setup
  - Lesson: never build from scratch in production

- Elastic Beanstalk: AWS managed platform for deploying
  web applications
  - You provide the code — AWS handles everything else
  - Supports multiple environments (dev, staging, prod)
  - Free service — you only pay for the resources it creates

### Something I found interesting:
- Seeing all services working together in one architecture
  made everything click — EC2, ELB, ASG, RDS, ElastiCache,
  EFS, and Route 53 are not separate topics,
  they are one system.

### Progress today:
- Finished Section 11 — 8/8 ✅
