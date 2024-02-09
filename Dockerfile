FROM python:2

WORKDIR /app

COPY requirements.txt ./

ENV PROJ_DIR=/usr/local/share/proj

RUN apt-get update && apt-get install -y libgeos-dev

RUN pip install --no-cache-dir -r requirements.txt


COPY helloworld.py ./

CMD ["python", "./helloworld.py"]