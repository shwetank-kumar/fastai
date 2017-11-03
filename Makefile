help:
	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=setup/Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker
PYTHON_VERSION?=3.6
CUDA_VERSION?=8.0
CUDNN_VERSION?=6
SRC=${CURDIR}
BACKEND=theano
PYTHON_VERSION?=3.6
CUDA_VERSION?=8.0
CUDNN_VERSION?=6


echo:
	echo $(SRC)

build:
	docker build -f ${DOCKER_FILE} -t dl_image $(SRC)/setup --build-arg python_version=$(PYTHON_VERSION) --build-arg cuda_version=$(CUDA_VERSION) --build-arg cudnn_version=$(CUDNN_VERSION)

notebook: build
	docker run -it -p 8888:8888 -p 6006:6006 --name dl -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) dl_image

ssh:
	docker exec -it dl /bin/bash
