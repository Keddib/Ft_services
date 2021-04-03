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
		* keeping pods healthy
		* intro to liveness probes
			1. an http get probe
			2. a tcp socket prob
			3. a Exec probe
		* creating an http-based Liveness prob
	-> ReplicationControllers
		* intro to RC
			> ensure its pods are always kept running.
			> if pod disappears (node disappearence, the pod was avicted from the node):
			> rc notice the missing pod and create a replacement pod.
			> rc manage not only a single pod but multiple copies (replicas) of a pod
			> that;s whre replicationControllers got thier name from.
		* the operation of RC
			1. rc constantly monitors the list of running pods and makes sure the actual number
			of pods's replicas always match the desired number.
			2. if too or less it reduce or encreaase the number.
			3. RC operate on sets of pods that match a certan label selector.
		* Understanding the three types of a RC
			1. A label selector:
				> which determines what pods are in the RC's scope
			2. A replca count:
				> which specifies the desired number of pods that should be running
			3. A pod template:
				> which is used when creating new pod replicas.
			!! all can be modified at any time, but only changess to replica count affect existing pods.
		* the benefits of using a RC (a simple concept)
			1. makes sure a pod or multiple pod replicas is always running by starting a new pod when an exsiting one goes missing
			2. when node fails , it creats a replacement for all the pods that are under rc's controle.
			3. easy horizontal scaling of pods ( manual and auto).
			!! a pod is never relocated to another node. instead, rc creats a new pod that has no relation with it's replacing
	-> Replicasets
		* 
# commands
	-> use minilube docker-deamon
		$ eval $(minikube -p minikube docker-env)
