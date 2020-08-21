echo "1/Upgrade docker" &&
docker-compose -f docker-compose-v.yml up -d --build
echo "2/ Check version" &&
curl localhost:9200
#echo "3/ Check index" &&
#curl localhost:9200/customer/_search?pretty
#echo "4/ Check state container" &&
docker ps -a
echo "Sucessfully upgrade"
