# Kubernetes Playground

Welcome to the Kubernetes Playground repository! This project serves as a practical, hands-on environment for learning and experimenting with Kubernetes and Infrastructure as Code (IaC).

## Repository Structure

The repository is divided into two main components:

- **`infra/`**: Contains Terraform configurations to provision the underlying infrastructure.
  - `infra/gke/`: Contains the Terraform code to spin up a cost-optimized, zonal Google Kubernetes Engine (GKE) cluster on Google Cloud Platform (GCP). For detailed setup and teardown instructions, please refer to the [infra/gke/README.md](infra/gke/README.md).
- **`k8s/`**: Contains sample Kubernetes manifests used to deploy resources to the cluster.
  - `k8s/deployments/`: Contains deployment manifests, such as a sample Nginx web application.
  - `k8s/services/`: Contains service manifests, such as a LoadBalancer setup to expose applications to the internet.
  - `k8s/volumes/`: Contains examples of ConfigMaps and other volume-related configurations.

## Getting Started

To get started with this playground, follow these steps:

1. **Provision the Infrastructure**: Navigate to `infra/gke` and use Terraform to spin up the GKE cluster. Refer to the [GKE Infrastructure README](infra/gke/README.md) for step-by-step instructions on authentication and cluster creation.
2. **Configure `kubectl`**: Once the cluster is running, configure your local `kubectl` to communicate with the newly created GKE cluster.
3. **Deploy the Application**: Navigate to the `k8s/` directory and use `kubectl apply -f` to deploy the sample applications and services. For example:
   ```bash
   kubectl apply -f k8s/deployments/web-app.yaml
   kubectl apply -f k8s/services/load-balancer.yaml
   ```
4. **Experiment**: Modify the manifests or write new ones to explore different Kubernetes features (e.g., Volumes, ConfigMaps, Secrets, Ingress, etc.).
5. **Teardown**: Don't forget to run `terraform destroy` in `infra/gke` when you are done to avoid unexpected GCP charges!
