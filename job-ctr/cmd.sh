python3 job.py
pod=$(kubectl get pods --selector=job-name=$JOB_NAME --output=jsonpath='{.items[*].metadata.name}')

kubectl logs --follow $pod | push_to_server.py