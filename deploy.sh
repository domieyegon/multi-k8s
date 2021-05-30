
#1. Build our images, tag each one, push each to docker hub
docker build -t dominic70/multi-client:latest -t dominic70/multi-client:$SHA ./client/Dockerfile ./client
docker build -t dominic70/multi-server:latest -t dominic70/multi-server:$SHA ./server/Dockerfile ./server
docker build -t dominic70/multi-worker:latest -t dominic70/multi-worker:$SHA ./worker/Dockerfile ./worker

docker push dominic70/multi-client:latest
docker push dominic70/multi-server:latest
docker push dominic70/multi-worker:latest

docker push dominic70/multi-client:$SHA
docker push dominic70/multi-server:$SHA
docker push dominic70/multi-worker:$SHA

#2. Apply all configs in the k8s folder
# kubectl apply -f ./k8s

#3. Imperactively set latest image on each deployment
# kubectl set image deployments/client-deployment client=dominic70/multi-client:$SHA
# kubectl set image deployments/server-deployment server=dominic70/multi-server:$SHA
# kubectl set image deployments/worker-deployment worker=dominic70/multi-worker:$SHA