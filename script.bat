echo "criando imagens"

docker build -t elizeurjr/projeto-backend:1.0 backend/.
docker build -t elizeurjr/projeto-database:1.0 database/.

echo "realizando o push"

docker push elizeurjr/projeto-backend:1.0
docker push elizeurjr/projeto-database:1.0

echo "Criando servicos K8s"

kubectl apply -f ./services.yml

echo "Criando deployment"

kubectl apply -f ./deployment.yml