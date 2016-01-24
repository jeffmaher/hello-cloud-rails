**WORK IN PROGRESS**: Most of this doesn't work yet.

# hello-cloud-rails

A dummy application to use to build a sample AWS infrastructure

## Infrastructure

These are some iterations in which this sample will be created.

### v1

Create a CloudFormation template for this:

- EC2
    - hello-cloud-rails:
        - Docker image
        - SQLite db (local)
        - Puma application server

### v2

Create a CloudFormation template for this:

- EC2
    - hello-cloud-rails:
        - Docker image
        - SQLite db (local)
        - **nginx reverse proxy in front of Puma**
        - Puma application server

### v3

Create a CloudFormation template for this:

- EC2
    - hello-cloud-rails:
        - Docker image
        - nginx w/ Reverse Proxy in front of Puma
        - Puma application server
        - **Linked to Postgres**
- **RDS
    - Postgres Database**

### v4

Create a CloudFormation template for this:

- **LoadBalancer**
- EC2 (**2 instances**)
    - hello-cloud-rails:
        - Docker image
        - nginx w/ Reverse Proxy in front of Puma
        - Puma application server
        - Linked to Postgres
- RDS
    - Postgres Database
