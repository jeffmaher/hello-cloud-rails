# hello-cloud-rails

A dummy application to use to build/learn about sample AWS infrastructure and how to use tools such as:

- Docker
- AWS EC2
- AWS CloudFormation
- AWS RDS

While the application being deployed is a Ruby on Rails application, not much (if any) knowledge is needed about Rails to be able to follow along.

_This is a work in progress application with incremental phases. Documentation is incredibly rough, but you're welcome to follow along._

## Infrastructure

These are some iterations in which some

### v1

**WORK IN PROGRESS**

- Instructions: [docs/v1 Setup.md](docs/v1 Setup.md)
- Git Tag: [v1](https://github.com/plusjeff/hello-cloud-rails/releases/tag/v1)
- Docker Image: [plusjeff/hello-cloud-rails:1](https://hub.docker.com/r/plusjeff/hello-cloud-rails/)

Create a CloudFormation template for this:

- EC2
    - hello-cloud-rails:
        - Docker image
        - SQLite db (local)
        - Puma application server

### v2

**NOT IMPLEMENTED**

Create a CloudFormation template for this:

- EC2
    - hello-cloud-rails:
        - Docker image
        - SQLite db (local)
        - **nginx reverse proxy in front of Puma**
        - Puma application server

### v3

**NOT IMPLEMENTED**

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

**NOT IMPLEMENTED**

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
