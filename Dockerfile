#*******************************************************************************
#Dockerfile
#*******************************************************************************

#Purpose:
#This file describes the operating system prerequisites for SHBAAM, and is used
#by the Docker software.
#Author:
#Wyte Krongapiradee, and Cedric H. David, 2018-2018


#*******************************************************************************
#Usage
#*******************************************************************************
#docker build -t shbaam:latest .                         #Create image
#docker run --rm --name shbaam_latest -it shbaam:latest  #Run image in container
#docker save -o shbaam_latest.tar shbaam:latest          #Save a copy of image
#docker load -i shbaam_latest.tar                        #Load a saved image


#*******************************************************************************
#Base Image
#*******************************************************************************
FROM python:2.7.15-slim-stretch


#*******************************************************************************
#Copy files into Docker image (this ignores the files listed in .dockerignore)
#*******************************************************************************
WORKDIR /shbaam
COPY . .


#*******************************************************************************
#Install Debian Packages
#*******************************************************************************
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libspatialindex-c4v5 \
    wget \
    ca-certificates \
    unzip && \
    rm -rf /var/lib/apt/lists/*


#*******************************************************************************
#Install Python Packages
#*******************************************************************************
RUN pip install --no-cache-dir \
    Fiona==1.7.11.post2 \
    netCDF4==1.3.1 \
    numpy==1.14.4 \
    requests==2.18.4 \
    Rtree==0.8.3 \
    Shapely==1.6.4.post1


#*******************************************************************************
#Intended (default) command at execution of image (not used during build)
#*******************************************************************************
CMD /bin/bash


#*******************************************************************************
#End
#*******************************************************************************
