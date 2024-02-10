FROM rocker/verse:4.1.0 

RUN apt-get -y update --allow-releaseinfo-change
RUN apt-get -y install libboost-dev libbamtools-dev libboost-iostreams-dev \
    libboost-log-dev libboost-system-dev libboost-test-dev libssl-dev \
    libcurl4-openssl-dev libxml2-dev libz-dev curl libhdf5-cpp-103 \
    libarmadillo-dev build-essential wget

RUN apt-get -y install libpng-dev libjpeg-dev libfreetype6-dev \
    libglu1-mesa-dev libgl1-mesa-dev pandoc zlib1g-dev libicu-dev \
    libgdal-dev gdal-bin libgeos-dev libproj-dev libavfilter-dev

RUN apt-get -y install libudunits2-dev


RUN apt-get clean

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH
