# k8s-gozd: GKE Cluster Setup with Terraform

## Overview

This repository is focused on setting up a **multi-node Kubernetes cluster** using **Google Kubernetes Engine (GKE)** on **Google Cloud Platform (GCP)** with **Terraform**. The project is configured to be **production-ready** and uses **Google Cloud's free tier** to minimize costs.

## Project Steps So Far

### 1. **Setting Up GCP Project**
- We started by setting up a new GCP project: **`k8s-gozd`**.
- The GCP project is configured to use **Google Kubernetes Engine (GKE)** to manage a Kubernetes cluster.
- We configured the required APIs for GKE, Compute Engine, and IAM.
  - **APIs enabled**:  
    - **Kubernetes Engine API**  
    - **Compute Engine API**  
    - **IAM API**
  
### 2. **Terraform Infrastructure Setup**
- We initialized **Terraform** to manage GKE cluster infrastructure.
- A **`main.tf`** file was created to set up the **Google provider** and **authentication**.
  - **Service Account** permissions: `roles/container.admin`, `roles/compute.admin`, and `roles/iam.serviceAccountUser`.
- The **node pool** was configured with resource specifications:
  - **Machine Type**: `e2-medium`  
  - **Disk Type**: `pd-standard` (standard persistent disks)  
  - **Disk Size**: 50 GB (adjustable for resource limits)
  - **Node Count**: 2 nodes (to reduce resource usage and avoid quota issues)

### 3. **Resolving Quota and Resource Issues**
- We ran into **quota issues** due to insufficient **CPUs** and **SSD storage**. We handled it in two ways:
  - **Requested a quota increase** in GCP via the Console for **CPUs** and **SSD storage**.
  - **Adjusted Terraform configuration** to reduce resource usage:
    - Reduced **disk size** from 900 GB to 50 GB.
    - Switched to **standard persistent disks** (`pd-standard`) to reduce quota consumption.
    - Reduced **node count** and **machine type** to meet quota limitations.

### 4. **Terraform Apply and State Management**
- During deployment, we encountered errors related to a **node pool creation failure** (`ERROR` state).
  - We removed the node pool from the **Terraform state** and re-applied the configuration to reset the state.
  
### 5. **Getting kubectl Working**
- Configured **kubectl** to interact with the newly created GKE cluster using the **`gcloud`** CLI.
  - Ran the command:  
    ```sh
    gcloud container clusters get-credentials <CLUSTER_NAME> --zone <ZONE> --project k8s-gozd
    ```
- Verified **kubectl** access to the cluster with commands like:
  ```sh
  kubectl get nodes

