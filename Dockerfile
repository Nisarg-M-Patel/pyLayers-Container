FROM python:2

WORKDIR /app

COPY requirements.txt ./

RUN apt-get update && apt-get install -y libgeos-dev && apt-get install -y python-pil

RUN pip install --no-cache-dir -r requirements.txt


COPY helloworld.py ./

CMD ["python", "./helloworld.py"]