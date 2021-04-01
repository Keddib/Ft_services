# FT_SERVICES
# Introduction to Kubernetes:
	-> Understanding the need of a system like k8s.
		1. moving from monolithics apps to microservices
		2. Providing a consistent environment to applications
		3. Moving to  continous delivery: DevOps and NoOps
	-> History and fisrt steps:
		1. Understanding its origins
		2. helping developers focus on the core app features and OPS teams achieve better resource utilization
		3. understanding the architecture of a k8s cluster:
			> the master node :
				- API server
				- ectd
				- scheduler
				- controller
			> worker node(s):
				- kubelet
				- kube-proxy
				- container runtime

		4. running an application in k8s
		5. Understanding the benefits of using kubernetes
			> Simplifying application deployment
			> Achieving better utilization of hardware
			> health cheking and self-healing
			> automatic scaling

# Kubernetes Objects
	-> Pods: running containers in K8S
		* Introduction to pods:
			1. understand why we need pods
			2. understand what is a pod
			3. orgnizing containers across pods proprly
		* Creating pods from yaml
			1. examin a YAML descriptor for a pod
				- $ kubectl get po [pod name] -o yaml
			2. creating a simple Yaml desc for a pod
			3. Using kubectl create to create a pod
				- $ kubectl create -f file.yaml
			4. viewing applicatin logs
				- $ kubectl logs [pod name]
				- $ kubectl logs [pod name] [container-name] # specify a container within a pod
			5. sending requests to the pod
				- forwarding a local network port to aport in a pod
				- $ kubctl port-forword [pod name] [local port]:[pod port]
		* orgnazing pods with labels
		* Listing subset of pods through label selectors
		* Using labels and selectors to constrain pod scheduling
	-> Liveness probes
		*


# commands
	-> use minilube docker-deamon
		$ eval $(minikube -p minikube docker-env)
