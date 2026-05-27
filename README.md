# AWS Cloud Portfolio — HaniCloudEngineer

## About Me
Transitioning from dentistry into cloud engineering.
Currently studying for AWS Solutions Architect Associate.
Documenting every step of the journey here.

---

## Learning Journey

## Date: Tuesday, May 27, 2026
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
