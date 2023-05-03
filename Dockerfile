# syntax = docker/dockerfile:1.2
FROM python:3.9-slim

# install os dependencies
RUN mkdir -p /usr/share/man/man1
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    vim \
    sudo \
    default-jre \
    git \
    gcc \
    libosmesa6 \
    build-essential \
    libavcodec-dev libavformat-dev libswscale-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev libgtk-3-dev \
    libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev \
    libopencv-dev x264 libx264-dev libssl-dev ffmpeg \
    cmake git \
    && rm -rf /var/lib/apt/lists/*

# install python dependencies
#RUN pip install numpy==1.23.3 scipy==1.9.3 scikit-image==0.19.3 scikit-learn==1.1.2 \
#	shapely==1.8.5.post1 Pillow==9.3.0 glfw==2.5.5 PyOpenGL==3.1.6 PyYAML==6.0 \
#	requests==2.28.1 torchserve==0.7.0 tqdm==4.64.1 Flask==2.2.3
#RUN pip install opencv-contrib-python
RUN pip install --no-binary opencv-python opencv-python
RUN mkdir -p /home/animation
COPY animated_drawings /home/animation/animated_drawings
COPY examples /home/animation/examples
COPY media /home/animation/media
COPY tests /home/animation/tests
COPY json_configs_example /home/animation/json_configs_example
COPY test_json.py /home/animation/test_json.py
COPY setup.py /home/animation/setup.py
#COPY test.py /home/animation/test.py
RUN pip install -e /home/animation
WORKDIR /home/animation
# starting command
CMD python /home/animation/test_json.py && sleep infinity
