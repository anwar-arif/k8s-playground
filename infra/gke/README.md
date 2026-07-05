# Kubernetes Playground (GKE)

This repository contains the Terraform configuration to quickly spin up a cost-optimized, zonal Google Kubernetes Engine (GKE) cluster for experimenting with Kubernetes.

## Prerequisites
- Google Cloud SDK (`gcloud`) installed
- Terraform installed
- `kubectl` installed
- The GKE gcloud auth plugin installed (`gcloud components install gke-gcloud-auth-plugin`)

## 1. Authentication
Before running Terraform, you must authenticate your local machine to Google Cloud using Application Default Credentials (ADC). This gives Terraform the permissions it needs to provision resources in your account.

Run this command and complete the login in your web browser:
```bash
gcloud auth application-default login
```

*(Note: If you run into quota or billing project errors, append `--billing-project=<your-project-id>` to the command above).*

## 2. Provisioning the Cluster
Navigate to this directory (where the `main.tf` file is located) and run Terraform to provision the cluster.

```bash
# Initialize Terraform (downloads required providers)
terraform init

# Preview the resources that will be created
terraform plan

# Create the cluster (type 'yes' when prompted)
terraform apply
```

Because we use a **zonal** cluster (`asia-southeast1-a`) and standard persistent disks, this footprint is very small and avoids default quota limitations.

## 3. Connecting to the Cluster
Once Terraform successfully finishes creating the cluster, you need to configure your local `kubectl` to communicate with it.

Run the following command to download the credentials for your new cluster:
```bash
gcloud container clusters get-credentials k8s-playground-501415-gke --zone asia-southeast1-a --project k8s-playground-501415
```

## 4. Verify Connection
Test that your context is configured correctly by asking the cluster for its nodes:
```bash
kubectl get nodes
```
You should see 1 node listed with a `Ready` status.

## 5. Teardown
When you are done experimenting, it is important to destroy the cluster so you don't continue to incur charges on Google Cloud.

```bash
terraform destroy
```
Type `yes` when prompted to permanently delete the cluster and its node pools.
