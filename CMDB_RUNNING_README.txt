Manual running with default bridge network
docker run --name cmdb_db -d -v ./data:/var/lib/mysql -h cmdb_db -p 3306:3306 davisruk/cmdb_db
docker run --name cmdb_backend -d -h cmdb_backend --link cmdb_db -p 8080:8080 davisruk/cmdb_backend
docker run -h cmdb_ui --name cmdb_ui -d -p 3000:3000 davisruk/cmdb_ui

Manual Running with docker network
docker network create cmdb_net
docker run --name cmdb_db -d -v ./data:/var/lib/mysql davisruk/cmdb_db
docker run --name cmdb_backend -p 8080:8080 davisruk/cmdb_backend
docker run --name cmdb_ui -p 3000:3000 davisruk/cmdb_ui

Running with docker-compose
docker-compose up
