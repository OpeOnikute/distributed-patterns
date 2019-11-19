# HTTPS + NGINX
This example shows adding HTTPS to a simple Node app using an Nginx sidecar.

The NGINX https config was gotten from this [official Kubernetes example](https://github.com/kubernetes/examples/tree/master/staging/https-nginx).

This repo has been adapted to provide a unified interface for declaring both the Nginx proxy and Node app with a simple config.

## Generate certificates
First generate a self signed rsa key and certificate:
`$ make keys KEY=/tmp/nginx.key CERT=/tmp/nginx.crt`

## Build Docker Images
If you make modifications and need to build your own docker images, you can change the tags and prefixes in `sidecar/Makefile` and `app/Makefile`.

1. Nginx - `cd ./sidecar && make push`
2. Node - `cd ./app && make push`

After pushing, change the reference images in `deployment.yaml` (`opeo/simple-node:1.0` & `opeo/nginxhttps:1.0`). 

## Create Nginx Config
Create a secret and a configmap.
```$ kubectl create secret tls nginxsecret --key /tmp/nginx.key --cert /tmp/nginx.crt secret "nginxsecret" created```

```$ kubectl create configmap nginxconfigmap --from-file=sidecar/default.conf configmap "nginxconfigmap" created```

## Create https application with nginx reverse proxy to NodeJS

`kubectl apply -f deployment.yaml`. This command defines:
- Services to expose both Nginx and Node.
- Deployment for Node.
- Replication controller for Nginx.

## Run the app in your browser
Run `kubectl get services`. You should see something similar to this: 
```
NAME                  TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
nginxsvc              NodePort       10.105.39.26    <none>        80:31598/TCP,443:31795/TCP   1h
simple-node-service   LoadBalancer   10.105.184.50   <pending>     3000:32595/TCP               1h
```

Then finally, run `minikube service nginxsvc` which will open both the HTTP (80) and HTTPS (443) versions in your browser.