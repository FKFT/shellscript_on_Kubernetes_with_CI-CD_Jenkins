#!/bin/bash

# Get a random pod name
pod=$(kubectl get pods -l app=my-app -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | shuf -n 1)

# Check if the selected pod is the canary pod
if [[ "$pod" == *"-canary-"* ]]; then
  # Run the canary script if it's the canary pod
  kubectl exec -it "$pod" -- /bin/bash -c "./shift_sched_canary.sh"
else
  # Run the regular script if it's a deployment pod
  kubectl exec -it "$pod" -- /bin/bash -c "./shift_sched.sh"
fi
