### ConfigMap 
A ConfigMap provides a way to inject configuration data into Pods.  
The data stored in a ConfigMap can be referenced in a volume of type configMap and then consumed by containerized applications running in a Pod.  


When referencing a ConfigMap, you provide the name of the ConfigMap in the volume. You can customize the path to use for a specific entry in the ConfigMap.
### Practice
1. apply the files `kubectl apply -f k8s/configMap`
2. verify the environment variables
```bash
kubectl exec backend-app -- env | grep APP_LOG_LEVEL
# Output: APP_LOG_LEVEL=INFO
```
3. verify mounted file
```bash
kubectl exec backend-app -- cat /etc/config/app.properties
# Output: 
# server.port=8080
# cache.enabled=true
# max.connections=20
```
4. verify that k8s creates files for each entry in the ConfigMap's data block
```bash
kubectl exec backend-app -- ls -la /etc/config
```