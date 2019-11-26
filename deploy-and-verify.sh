kubectl apply -f deployments/
kubectl apply -f services/

for serviceName in hello-world-message-json-go reverse-message-json-go
do
        echo "===================="
        echo Wait for $serviceName
        kubectl wait \
                --for=condition=available \
                --timeout=30s \
                deployment/$serviceName

        echo "===================="
        echo Verify $serviceName
        curl $(minikube service $serviceName --url)
        echo
done
