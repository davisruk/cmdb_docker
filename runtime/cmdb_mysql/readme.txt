Instructions for manual building:

This image is reliant upon the official mysql image hosted at DockerHub; any host that builds
this image requires access to this site.

If you make any changes to the SQL script or Dockerfile then you need to rebuild the image:

docker build -t davisruk/cmdb_db .

Then push the image to your favoured image repository (e.g. DockerHub or your own internal one)

Running with default bridge network:
In order to save data externally the container requires a volume mapping that mounts a folder
from the host (or somewhere accessible to the host).

On linux host:
docker run --name cmdb_db -h <my_db_hostname> -v ~/data:/var/lib/mysql -p 3306:3306 davisruk/cmdb_db

On Windows host:
docker run --name cmdb_db -h <my_db_hostname> -v ./data:/var/lib/mysql -p 3306:3306 davisruk/cmdb_db

-v = mount host folder to container folder. For some reason on Windows the container stops
running if you specify a folder on the local disk. The "./data" above maps to the folder on
the VM that windows uses under the covers. Not sure why this is the case but doesn't really
matter because only a lunatic would run docker on windows in prod (or windows in prod in general).

-h = hostname, this is required to more easily link containers. Docker does not post
container names into etc/hosts on the default bridge network so containers that need
access to this one need to link to the hostname.

-p = expose port on container over port on host

Linking to the database
docker run --link <my_db_hostname> my_container_to_link

Running with docker network:
Docker posts container names into etc/hosts files for containers on the same network so we no longer
need the -h option. This is much easier to manage as other containers can link through known dependencies.

docker network create <my_network>
docker run --network <my_network> --name cmdb_db -v ~/data:/var/lib/mysql -p 3306:3306 davisruk/cmdb_db


