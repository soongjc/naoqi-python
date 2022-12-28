FROM amd64/ubuntu:14.04

# Install dependencies
RUN sudo apt-get -y install software-properties-common
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get install -y python-pip iproute2 telnet iputils-ping gcc-4.9 g++-4.9

# Set the working directory to /naoqi
WORKDIR /naoqi

# Copy the NAOqi for Python SDK
ADD pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz /naoqi/

# Copy the boost fix
# See https://community.ald.softbankrobotics.com/en/forum/import-issue-pynaoqi-214-ubuntu-7956
ADD boost/* /naoqi/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/

# Set the path to the SDK
ENV PYTHONPATH=${PYTHONPATH}:/naoqi/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/lib/python2.7/site-packages
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/x86_64-linux-gnu/
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/naoqi/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/lib
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/naoqi/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327

# Copy the source folder
COPY ./src /naoqi/src
