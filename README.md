## Note

- **Kodekloud**: This project was deployed in the CI/CD playground of kubernetes

## Prerequisites

- **Run Kubernetes_debian**: This script is to automatically install Kubernetes through Kubeadm on a debian machine skip this part if you already have a cluster

- **Bash 4.0+**: This script requires Bash version 4.0 or higher.

- **Run setupKUBECONFIG.sh**: This script is required to be run before running the Jenkinsfile. Please ensure to execute this setup first in the lab before proceeding with the Jenkinsfile.

## Deployment

- **Jenkins file**: once the cluster is up and running and jenkins is running in your local host make a pipeline job and copy the jenkins file and place it on the pipeline

## Troubleshooting

- **docker login**:  
  When faced with this error:  
  `"toomanyrequests: You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limit"`  
  Run the following to authenticate with Docker:
  ```bash
  docker login

## Testing the Deployment

- **kubectl exec**:  
  To test containers after they are deployed, use the following command to exec into the running pod:
  ```bash
  kubectl exec -it <podname> /bin/sh

- **kubectl exec**:
  To randomly test the pods, use the following command to exec into the running pod: run the **random.sh**, this is an optional way
  to access the running pods. you can manually exec to the pods using the usual commands.
