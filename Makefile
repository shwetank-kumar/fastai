help:
	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)
SRC=${CURDIR}

echo:
	echo $(SRC)

build:
	docker build -f setup/Dockerfile -t dl_image $(SRC)/setup

run: build
	docker run -it -p 8080:8080 -p 6006:6006 --name dl -v $(SRC):/root dl_image bash

ssh:
	docker exec -it dl /bin/bash

	# jupyter notebook --allow-root
	# stick in the browser: localhost:8888/?token=<token>
