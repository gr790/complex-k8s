docker build -t rahulroot/multi-client -f ./client/Dockerfile ./client
docker build -t rahulroot/multi-server -f ./server/Dockerfile ./server
docker build -t rahulroot/multi-worker -f ./worker/Dockerfile ./worker
docker push rahulroot/multi-client
docker push rahulroot/multi-server
docker push rahulroot/multi-worker
kubctl apply -f k8s

kubctl set image deployments/server-deployment server=rahulroot/multi-server

