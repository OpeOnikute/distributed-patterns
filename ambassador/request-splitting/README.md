# Request Splitting

"In many production systems, it is advantageous to be able to perform request splitting, where some fraction of all requests are not serv‐ iced by the main production service but rather are redirected to a different imple‐ mentation of the service. Most often, this is used to perform experiments with new, beta versions of the service to determine if the new version of the software is reliable or comparable in performance to the currently deployed version."

# Steps
1. Create the config map to store the NGINX config. Top-level directives like http aren't allowed in NGINX configs in K8s, so you have to strip those out.
`kubectl create configmap ambassador-config --from-file=nginx.conf`
2. Create the `experiment` and `web` deployments and their services to make them accessible in the cluster.
`kubectl apply -f app-deployment.yaml` and `kubectl apply -f app-services.yaml`
3. Create the ambassador deployment. It is important that the app services are running before this is created, because Nginx doesn't like looking for stuff it can't find and will crash.
`kubectl apply -f ambassador-deployment.yaml` and `kubectl apply -f ambassador-service.yaml`
4. If you're running on minikube, you can then view it on your browser using `minikube service ambassador`.  