apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-deploy
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels: { app: backend }
  template:
    metadata:
      labels: { app: backend }
    spec:
      containers:
        - name: backend
          image: ${ECR_URL}:latest
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 80
          # Если Kestrel не слушает 80 - раскомментируй:
          # env:
          #   - { name: ASPNETCORE_URLS, value: "http://0.0.0.0:80" }
          env:
            - { name: DB_HOST,     value: "${DB_HOST}" }
            - { name: DB_PORT,     value: "${DB_PORT}" }
            - { name: DB_NAME,     value: "${DB_NAME}" }
            - { name: DB_USER,     value: "${DB_USER}" }
            - { name: DB_PASSWORD, value: "${DB_PASSWORD}" }
          readinessProbe:
            httpGet: { path: /login, port: 80 }
            initialDelaySeconds: 10
            periodSeconds: 5
          livenessProbe:
            httpGet: { path: /, port: 80 }
            initialDelaySeconds: 30
            periodSeconds: 10