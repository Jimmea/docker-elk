echo "1/Set permission folder volumn" &&
sudo chmod -R 777 data-volumn
sudo chmod -R 777 libs

echo "2/Upgrade docker" &&
docker-compose -f docker-compose6x.yml up -d

echo "3/ Check version" &&
curl localhost:9200

echo "4/ Check state container" &&
docker ps -a

echo "Sucessfully upgrade"
