#help:
#	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)
SRC=${CURDIR}

echo:
	echo $(SRC)

build:
	docker build -f setup/Dockerfile -t dl_image $(SRC)/setup

run: build
	docker run -it -p 8888:8888 -p 6006:6006 --name dl -v $(SRC):/root dl_image #bash

ssh:
	docker exec -it dl /bin/bash


#help:
#    @cat Makefile

#DATA?="${HOME}/Data"
#GPU?=0
#DOCKER_FILE=Dockerfile
#DOCKER=GPU=$(GPU) nvidia-docker
#BACKEND=tensorflow
#PYTHON_VERSION?=3.5
#CUDA_VERSION?=8.0
#CUDNN_VERSION?=6
#TEST=tests/
#SRC?=$(shell dirname `pwd`)

#build:
#	docker build -t keras --build-arg python_version=$(PYTHON_VERSION) --build-arg cuda_version=$(CUDA_VERSION) --build-arg cudnn_version=$(CUDNN_VERSION) -f $(DOCKER_FILE) .

#bash: build
#	$(DOCKER) run -it -v $(SRC):/src/workspace -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) keras bash

#ipython: build
#	$(DOCKER) run -it -v $(SRC):/src/workspace -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) keras ipython

#notebook: build
#	$(DOCKER) run -it -v $(SRC):/src/workspace -v $(DATA):/data --net=host --env KERAS_BACKEND=$(BACKEND) keras

#test: build
#	$(DOCKER) run -it -v $(SRC):/src/workspace -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) keras py.test $(TEST)
