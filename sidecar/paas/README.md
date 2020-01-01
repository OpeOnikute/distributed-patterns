# PAAS - Platform as a Service
"The Node.js server is instrumented so that it automatically reloads the server when new files are updated. This is accom‐ plished with the nodemon tool.
The sidecar container shares a filesystem with the main application container and runs a simple loop that synchronizes the filesystem with an existing Git repository"

# Notes
- This just demonstrates the principle. Since the paas is a sub-folder in an existing git repo, the git pull won't work. 
 
## TODO
- [x] Implement Docker compose version.
- [ ] Implement K8s version.