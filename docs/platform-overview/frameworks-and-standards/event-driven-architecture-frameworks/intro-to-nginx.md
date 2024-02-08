# Intro to NGINX

### What is NGINX?

[NGINX](https://www.nginx.com/) is a free, open-source, high-performance web server with a rich feature set, simple configuration, and low resource consumption that can also function as a reverse proxy, load balancer, mail proxy, HTTP cache, and many other things.

### How NGINX is working?

NGINX allows you to hide a server application's complexity from a front-end application. It uses an event-driven, asynchronous approach to create a new process for each web request, with requests handled in a single thread.

### Using NGINX with FLOWX Designer

[**The NGINX Ingress Controller for Kubernetes**](https://kubernetes.github.io/ingress-nginx/) - `ingress-nginx` is an ingress controller for Kubernetes using NGINX as a reverse proxy and load balancer.

Ingress allows you to route requests to services based on the host or path of the request, centralizing a number of services into a single entry point.

The [ingress resource](https://www.nginx.com/products/nginx-ingress-controller/nginx-ingress-resources/) simplifies the configuration of **SSL/TLS** **termination**, **HTTP load-balancing**, and **layer routing**.

For more information, check the following section:

[Using NGINX as a K8S ingress controller](https://www.nginx.com/resources/videos/using-nginx-as-a-kubernetes-ingress-controller)

#### Integrating with FLOWX Designer

FLOWX Designer is using NGINX ingress controller for the following actions:

1. For routing calls to plugins
2. For routing calls to the [FLOWX Engine](../../../platform-deep-dive/core-components/flowx-engine.md):

* Viewing current instances of processes running in the FLOWX engine
* Testing process definitions from the FLOWX Designer - route the API calls and SSE communications to the FLOWX engine backend
* Accessing REST API of the backend microservice

3. For configuring the Single Page Application (SPA) - FLOWX Designer SPA will use the backend service to manage the platform via REST calls

In the following section, you can find a suggested NGINX setup, the one used by FLOWX.AI:

[Designer setup guide](../../../flowx-designer/designer-setup-guide/designer-setup-guide.md)

### Installing NGINX Open Source

For more information on how to install NGINX Open Source, check the following guide:

[NGINX Install Guide](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source?_ga=2.31029759.1179818521.1651763502-1509066026.1651763502)
