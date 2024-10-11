## Prerequisites

- **Bash 4.0+**: This script requires Bash version 4.0 or higher.

- **Run setupKUBECONFIG.sh**: This script is required to be run before running the Jenkinsfile. Please ensure to execute this setup first in the lab before proceeding with the Jenkinsfile.

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
