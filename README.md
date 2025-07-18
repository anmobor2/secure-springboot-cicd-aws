# Secure SpringBoot CI/CD AWS Project Submission

## Deliverables
- Azure DevOps pipeline YAML: azure-pipelines.yml
- Additional scripts: generate-cosign-keys.sh (for Cosign key generation; run locally and store private key in Azure DevOps variables)
- Helm Charts and Kubernetes Manifests: helm/spring-app/ (includes Chart.yaml, values.yaml, templates/deployment.yaml, templates/service.yaml)

## Non-Code Configurations (Azure DevOps UI)
These must be set manually in Azure DevOps and can't be included in code:
- **Manual Approvals**: Configured in Pipelines > Environments > [dev/staging/prod] > Approvals and checks. Add approvers (e.g., your email), set minimum approvals (1), and timeout (e.g., 7 days). The pipeline references these environments but doesn't define approvals.
- **Service Connections**: Project Settings > Service connections > Create AWS and Kubernetes connections for 'aws-service-connection' and 'eks-service-connection'.
- **Variable Groups**: Pipelines > Library > Variable groups > Create 'cosign-secrets' with 'cosignPrivateKey' (secret, from Cosign private key) and 'aws-variables' with 'awsAccountId'.
- **SonarQube Setup**: If used, create a SonarQube service connection and project in SonarQube server.

## Setup Instructions
- Link variable groups and service connections in the pipeline editor (Variables > Variable groups).
- Create environments (dev, staging, prod) in Pipelines > Environments for approvals.
- Trigger from dev branch to test.