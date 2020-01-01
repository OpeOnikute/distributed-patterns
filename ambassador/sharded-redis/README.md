# Sharded Redis
In this case, the ambassador is used to decide where to direct requests in a sharded system. It's also possible to add all the sharding logic in the external shard service, but it's all a trade-off ultimately.

# Steps
1. Create the Redis pods (3 replicas) using a stateful set controller:
`kubectl create -f redis-shards.yaml`
2. Create a Redis service to get DNS names for the pods:
`kubectl create -f redis-service.yaml`
3. Create a config map to store the `twemproxy` config:
`kubectl create configmap twem-config --from-file=nutcracker.yaml`
4. Create the deployment:
`kubectl create -f deployment.yaml`

# Notes
1. In the book, the `nutcracker` command specified "7" and "6222" as integers. Turns out label values must be strings or you'll get this: `error when creating "deployment.yaml": Pod in version "v1" cannot be handled as a Pod: v1.Pod: Spec: v1.PodSpec: Containers: []v1.Container: v1.Container: Command: []string: ReadString: expects " or n,but found 7...`. 
See [this issue](https://github.com/kubernetes/kubernetes/issues/57509) for more context.
