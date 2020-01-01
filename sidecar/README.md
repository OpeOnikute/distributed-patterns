# Sidecar Pattern

The sidecar pattern is used to add an extra layer on an existing application to provide extra functionality. It usually consists of an application container, and a sidecar container. Examples include adding HTTPS to an existing system, implementing a resource-monitoring endpoint etc.

This pattern has various benefits as sidecars can be re-used across different apps, and applications can be improved without editing the source code or messing with complicated build systems.

This repo is gonna be used to explore different examples of this pattern using mostly Docker and Kubernetes. Examples are not intended to be production-level but could serve as building blocks.