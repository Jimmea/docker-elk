echo "1/Set permission folder volumn" &&
sudo chmod -R 775 data-volumn-7X
sudo chmod -R 775 libs
echo "2/Build and up" &&
docker-compose up -d
echo "3/ Check version" &&
curl localhost:9200
echo "4/ Check state container" &&
docker ps -a
echo "Sucessfully upgrade"
