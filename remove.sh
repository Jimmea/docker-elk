echo "1/Remove container" &&
docker rm $(docker ps -a -q) -f

echo "2/Remove images" &&
docker rmi $(docker images -a -q) -f
