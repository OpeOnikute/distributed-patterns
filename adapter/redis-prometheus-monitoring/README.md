# Redis+Prometheus Monitoring

Redis is a key/value store that does not implement a monitoring interface that can be used by Prometheus. This adds an adapter to provide that interface.

# Steps
1. Create the pod `kubectl apply -f pod.yaml`