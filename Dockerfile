#base image
FROM python:2

#set working directory
WORKDIR /app

#install PROJ binaries and grid shift files
FROM osgeo/proj:latest AS proj

#Switch back to base image
FROM python:2

#set PROJ_DIR env variable
ENV PROJ_DIR=/usr/local

#copy PROJ binaries and grid shift files from proj stage
COPY --from=proj / $PROJ_DIR/

#install git
RUN apt-get update && apt-get install -y git

# Clone your library from GitHub (if needed)
RUN git clone https://github.com/pylayers/pylayers.git .

COPY requirements.txt ./

RUN apt-get update && apt-get install -y libgeos-dev

RUN pip install --no-cache-dir -r requirements.txt


COPY helloworld.py ./

CMD ["python", "./helloworld.py"]