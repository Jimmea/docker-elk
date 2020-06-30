# Docker

**1. Run docker**
```
docker-compose build

docker-compose up -d

docker-compose logs -f

docker-compose down
```


**2. Copy config elasticsearch.yaml from container to host|local**
```
docker cp [name_container]:/usr/share/elasticsearch/config/elasticsearch.yml source/elasticsearch.yml 
```
