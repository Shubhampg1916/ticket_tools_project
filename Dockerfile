FROM python:3.11.4-slim-bullseye
WORKDIR /app

ENV PYTHONUNBUFFRED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update

RUN pip install --upgrade pip

COPY ./requirements.txt /app/
RUN pip install -r requirements.txt


COPY . /app

ENTRYPOINT ["gunicorn", "core.wsgi"]