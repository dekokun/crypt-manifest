kubectl create secret generic mackerel --from-literal=apikey="<your mackerel api key>" -n bitcoin
KUBERNETES_REGISTRY=aws-ecr
DOCKER_ECR=<you ECR repository>
DOCKER_USERNAME=AWS
DOCKER_EMAIL=<your mail address>
DOCKER_SECRET=$(aws --profile <your profile> ecr get-login-password)
kubectl delete secrets -n bitcoin ${KUBERNETES_REGISTRY} 2> /dev/null
kubectl create secret -n bitcoin docker-registry ${KUBERNETES_REGISTRY} \
--docker-server=${DOCKER_ECR} \
--docker-username=${DOCKER_USERNAME} \
--docker-password=${DOCKER_SECRET} \
--docker-email=${DOCKER_EMAIL}

