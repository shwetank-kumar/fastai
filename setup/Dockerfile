FROM ubuntu:16.04

# MAINTAINER Shwetank Kumar <shwetank@hoodline.com>

# ARG TENSORFLOW_VERSION=1.2.1
# ARG TENSORFLOW_ARCH=cpu
# ARG KERAS_VERSION=2.0.6

# Install some dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		libjpeg-dev \
		liblcms2-dev \
		libopenblas-dev \
		liblapack-dev \
		libpng12-dev \
		libssl-dev \
		libtiff5-dev \
		libwebp-dev \
		libzmq3-dev \
		nano \
		pkg-config \
		python-dev \
        screen \
		software-properties-common \
		unzip \
		vim \
		wget \
		zlib1g-dev \
		qt5-default \
		libvtk6-dev \
		zlib1g-dev \
		libjpeg-dev \
		libwebp-dev \
		libpng-dev \
		libtiff5-dev \
		libjasper-dev \
		libopenexr-dev \
		libgdal-dev \
		libdc1394-22-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		libx264-dev \
		yasm \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libv4l-dev \
		libxine2-dev \
		libtbb-dev \
		libeigen3-dev \
		python-dev \
		python-h5py \
		python-tk \
		python-nose \
		python-numpy \
        python-pip \
		python-scipy \
		python-skimage \
		python-sympy \
		python3-dev \
		python3-tk \
		python3-numpy \
        python3-pip \
		ant \
		default-jdk \
		doxygen \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* && \
	update-alternatives --set libblas.so.3 /usr/lib/openblas-base/libblas.so.3
	# Link BLAS library to use OpenBLAS using the alternatives mechanism (https://www.scipy.org/scipylib/building/linux.html#debian-ubuntu)
# Install Python packages via pip
RUN pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install --upgrade ipython && \
	pip3 --no-cache-dir install \
		Cython \
        google.cloud==0.25.0 \
        google.cloud.bigquery==0.24.0 \
        google-cloud-core==0.24.1 \
		ipykernel \
		jupyter \
		ndg-httpsclient \
		pandas==0.20.3 \
		path.py \
		Pillow \
    psycopg2 \
		pyasn1 \
		pygments \
		pyopenssl \
		requests[security] \
        scikit-learn \
        seaborn \
		six \
		sphinx \
        tensorflow \
		wheel \
		zmq \
    git+git://github.com/fchollet/keras.git@${KERAS_VERSION} \
		&& \
		python3 -m ipykernel.kernelspec

# --force-reinstall ensures that in the end, the alias pip points to pip2 (not pip3)
RUN pip2 --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install --upgrade ipython && \
		pip --no-cache-dir install \
		bleach \
		bs4 \
		Cython \
		psycopg2 \
		html \
		ipykernel \
		ndg-httpsclient \
		pandas==0.20.3 \
		path.py \
		Pillow \
		pyasn1 \
		pygments \
		pyopenssl \
		requests[security] \
        scikit-learn \
        seaborn \
		six \
		sphinx \
        tensorflow \
		wheel \
		zmq \
    git+git://github.com/fchollet/keras.git@${KERAS_VERSION} \
		&& \
		python2 -m ipykernel.kernelspec

# Set WORKDIR
WORKDIR "/root"

# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

# Expose Ports for TensorBoard (6006), Ipython (8888)
EXPOSE 6006 8888

#CMD ["/bin/echo $GOOGLE_APPLICATION_JSON > google_credentials.json"]
