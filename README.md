# Terraform EC2 Auto-Provisioning with Docker Compose

This project demonstrates how to provision an AWS EC2 instance using Terraform and automatically deploy a Docker Compose–based MERN application at instance startup.

## Overview
- AWS EC2 infrastructure provisioned using Terraform
- Docker and Docker Compose installed automatically using EC2 user_data
- Pre-built Docker images pulled from Docker Hub
- Multi-container MERN application (Frontend, Backend, MongoDB) started at boot

## Technologies Used
Terraform, AWS EC2, Docker, Docker Compose, Linux, MongoDB

## Architecture Flow
1. Terraform provisions an EC2 instance and security group
2. EC2 executes user_data during first boot
3. Docker and Docker Compose are installed automatically
4. Docker Compose pulls images from Docker Hub
5. Containers start and the application becomes accessible via EC2 public IP

## How to Run
```bash
terraform init
terraform apply
