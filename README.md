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

## Date: Thursday, June 4, 2026
### Topic: Section 12 — Amazon S3 Introduction (15/15 ✅)

### What I learned today:

- S3 (Simple Storage Service): object storage service
  - Store any type of file — images, videos, backups, code
  - Files are stored in Buckets (like folders)
  - Bucket names must be globally unique
  - Max object size: 5TB

- S3 Security — Bucket Policy:
  - JSON based policy attached to the bucket
  - Controls who can access the bucket and how
  - Can allow public access or restrict to specific users

- S3 Website Hosting:
  - S3 can host static websites directly
  - Just enable static website hosting on the bucket
  - Must make bucket public via Bucket Policy

- S3 Versioning:
  - Keeps multiple versions of the same file
  - Protects against accidental deletion
  - Must be enabled at the bucket level

- S3 Replication:
  - CRR (Cross Region Replication) → replicate to
    a different region, used for compliance or latency
  - SRR (Same Region Replication) → replicate within
    same region, used for log aggregation
  - Versioning must be enabled on both buckets

- S3 Storage Classes:
  - S3 Standard → frequently accessed data,
    high availability, most expensive
  - S3 Standard-IA → infrequently accessed,
    lower cost, retrieval fee applies
  - S3 One Zone-IA → same as Standard-IA
    but stored in one AZ only, cheaper
  - S3 Glacier Instant → archived data,
    retrieved in milliseconds
  - S3 Glacier Flexible → retrieved in minutes or hours
  - S3 Glacier Deep Archive → cheapest,
    retrieved in 12-48 hours
  - S3 Intelligent-Tiering → automatically moves objects
    between tiers based on access patterns

- S3 Express One Zone:
  - Highest performance storage class
  - Single AZ, lowest latency, for latency-sensitive apps

### Something important for the exam:
- Know the difference between each storage class —
  the exam loves to give a scenario and ask
  which storage class is the most cost-effective.

### Progress today:
- Finished Section 12 — 15/15 ✅

- ## Date: Friday, June 5, 2026
### Topic: Section 13 — Advanced Amazon S3 (9/9 ✅)

### What I learned today:

- S3 Lifecycle Rules:
  - Automatically transition objects between storage classes
  - Example: move to Standard-IA after 30 days,
    then to Glacier after 90 days
  - Can also expire (delete) objects after a set time
  - S3 Analytics helps decide when to transition objects

- S3 Requester Pays:
  - Normally the bucket owner pays for storage and requests
  - With Requester Pays — the requester pays for downloads
  - Useful when sharing large datasets with other accounts

- S3 Event Notifications:
  - Trigger actions when something happens in S3
  - Events: object created, deleted, restored
  - Can send to: SNS, SQS, Lambda, or EventBridge
  - Use case: auto-process uploaded images with Lambda

- S3 Performance:
  - S3 supports 3,500 PUT and 5,500 GET requests
    per second per prefix
  - Multi-part upload: recommended for files over 100MB,
    required for files over 5GB
  - S3 Transfer Acceleration: speeds up uploads by routing
    through AWS Edge Locations

- S3 Batch Operations:
  - Run bulk operations on existing S3 objects
  - Examples: copy objects, encrypt unencrypted objects,
    invoke Lambda on each object
  - Uses S3 Inventory to get the list of objects

- S3 Storage Lens:
  - Organization-wide visibility into S3 usage
  - Shows storage trends, costs, and activity metrics
  - Free default dashboard or paid advanced metrics

### Something important for the exam:
- Lifecycle Rules + Storage Classes are always tested
  together — know which class to transition to
  and after how many days.

### Progress today:
- Finished Section 13 — 9/9 ✅

- ## Date: Saturday, June 6, 2026
### Topic: Section 14 — Amazon S3 Security (16/16 ✅)

### What I learned today:

- S3 Encryption:
  - SSE-S3 → AWS manages the keys, enabled by default
  - SSE-KMS → you control the keys via AWS KMS,
    extra security and audit trail
  - SSE-C → you provide your own keys,
    AWS does not store them
  - Client-Side Encryption → encrypt before uploading,
    AWS never sees the data unencrypted
  - DSSE-KMS → dual-layer encryption with KMS keys

- S3 Default Encryption:
  - SSE-S3 is applied automatically to all new objects
  - Can be changed to SSE-KMS at bucket level

- S3 CORS (Cross-Origin Resource Sharing):
  - Controls which domains can access your S3 bucket
    from a browser
  - Must configure CORS rules if your website fetches
    data from a different S3 bucket

- S3 MFA Delete:
  - Requires MFA to permanently delete object versions
  - Extra protection against accidental or malicious deletion
  - Only the root account can enable it

- S3 Access Logs:
  - Log all requests made to your S3 bucket
  - Stored in a separate S3 bucket
  - Useful for auditing and security analysis

- S3 Pre-signed URLs:
  - Generate a temporary URL to grant access to
    a specific object for a limited time
  - Use case: share a private file without making
    the bucket public

- Glacier Vault Lock & S3 Object Lock:
  - Object Lock → prevent object deletion for a set time
    - Retention Mode Compliance → no one can delete,
      not even root
    - Retention Mode Governance → only privileged
      users can delete
  - Glacier Vault Lock → WORM policy
    (Write Once Read Many) for compliance

- S3 Access Points:
  - Simplify access management for large S3 buckets
  - Each team or app gets its own access point
    with its own policy

- S3 Object Lambda:
  - Run Lambda function on S3 objects before
    they are returned to the requester
  - Use case: transform or filter data on the fly

### Something important for the exam:
- Know the difference between all encryption types —
  SSE-S3 vs SSE-KMS vs SSE-C is a very common
  exam question.

### Progress today:
- Finished Section 14 — 16/16 ✅
