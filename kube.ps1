wget "https://go.knts.app/link/wNjTQuxVtS8sBbhf9" -o $pwd/kluster.yaml
$Env:KUBECONFIG="$pwd/kluster.yaml"
kubectl get nodes
kubectl apply -f grafana/deployment.yaml
kubectl apply -f grafana/service.yaml
kubectl get pods
kubectl get svc
kubectl get pods -l app=grafana
echo "http://$(kubectl get pod -l app=grafana -o=jsonpath='{.items[0].status.hostIP}'):$(kubectl get svc grafana-deployment -o=jsonpath='{.spec.ports[0].nodePort}')"

