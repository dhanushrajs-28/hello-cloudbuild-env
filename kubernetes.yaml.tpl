apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-cloudbuild
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-cloudbuild
  template:
    metadata:
      labels:
        app: hello-cloudbuild
    spec:
      containers:
      - name: hello-cloudbuild
        image: us-west1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/my-repository/hello-cloudbuild:COMMIT_SHA
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: hello-cloudbuild
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: hello-cloudbuild
