#help:
#	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE_CPU=setup/Dockerfile.cpu
DOCKER_FILE_GPU=setup/Dockerfile.gpu
SRC=${CURDIR}
BACKEND=theano


echo:
	echo $(SRC)

build_cpu:
	docker build -f ${DOCKER_FILE_CPU} -t dl_image $(SRC)/setup #--build-arg python_version=$(PYTHON_VERSION) --build-arg cuda_version=$(CUDA_VERSION) --build-arg cudnn_version=$(CUDNN_VERSION)

notebook_cpu: build_cpu
	docker run -it -p 8888:8888 -p 6006:6006 --name dl -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) dl_image

build_gpu:
	docker build -f ${DOCKER_FILE_GPU} -t dl_image $(SRC)/setup #--build-arg python_version=$(PYTHON_VERSION) --build-arg cuda_version=$(CUDA_VERSION) --build-arg cudnn_version=$(CUDNN_VERSION)

notebook_gpu: build_gpu
	docker run -it -p 8888:8888 -p 6006:6006 --name dl -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) dl_image


ssh:
	docker exec -it dl /bin/bash
