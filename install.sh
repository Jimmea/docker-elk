echo "1/Set permission folder volumn" &&
sudo chmod -R 777 data-volumn-7X
sudo chmod -R 777 libs

echo "2/Build and up" &&
docker-compose up -d

echo "3/ Check version" &&
curl localhost:9200
curl localhost:9200/_cat/indices

echo "4/ Check list container" &&
docker ps -a

echo "Sucessfully install"
