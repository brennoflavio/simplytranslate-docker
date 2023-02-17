FROM python:3.11

RUN apt-get update -y
RUN apt-get install git

RUN mkdir /app
WORKDIR /app

RUN git clone https://codeberg.org/SimpleWeb/SimplyTranslate-Web.git
RUN cd SimplyTranslate-Web

WORKDIR /app/SimplyTranslate-Web
RUN pip install -r requirements.txt
RUN pip install uvicorn

CMD ["uvicorn", "main:app", "--port", "5000", "--host", "0.0.0.0"]

