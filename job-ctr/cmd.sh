#!/bin/bash

JOB_ID=$(python ./job.py "$IMAGE" "$NAME")
RET=1
until [ ${RET} -eq 0 ]; do
    kubectl get pods --selector=job-name="$JOB_ID" --output=jsonpath='{.items[*].metadata.name}'
    RET=$?
    sleep 2    
done


POD=$(kubectl get pods --selector=job-name="$JOB_ID" --output=jsonpath='{.items[*].metadata.name}')
kubectl logs --follow $POD | python3 looper.py