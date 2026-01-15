
# Docker Node.js CI/CD Project

## Overview
This project demonstrates a complete CI/CD pipeline for a simple Node.js application using Docker. The pipeline builds the Docker image locally, pushes it to Docker Hub, AWS ECR, and GCP Artifact Registry, and automates the process using GitHub Actions.

## Application
- A simple Node.js Express application running on port 3000.
- Responds with "Hello World from Docker!" on the root endpoint.

## Docker Setup
1. **Dockerfile**:
   - Uses Node.js official image.
   - Copies application files and installs dependencies.
   - Exposes port 3000.
   - Runs `node app.js`.

2. **Local Build & Run**:
   ```bash
   docker build -t docker-node-app .
   docker run -p 3000:3000 docker-node-app
   ```
   - Access the app at `http://localhost:3000`

## CI/CD Pipeline
- **Docker Hub**: Image is tagged and pushed to Docker Hub.
- **AWS ECR**: Image is tagged and pushed to AWS Elastic Container Registry.
- **GCP Artifact Registry**: Image is tagged and pushed to Google Cloud Artifact Registry.
- **GitHub Actions**: Automates build and push steps whenever changes are pushed to the main branch.

## Workflow Automation
- `.github/workflows/docker-publish.yml` handles all three registry pushes.
- Requires GitHub repository secrets for authentication:
  - `DOCKERHUB_USERNAME` & `DOCKERHUB_TOKEN`
  - `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY`
  - `GCP_SERVICE_ACCOUNT_KEY` (if using JSON key, but note Workload Identity Federation is recommended)

---