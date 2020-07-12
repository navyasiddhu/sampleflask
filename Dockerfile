# python:alpine is 3.{latest}
FROM python:alpine 
LABEL maintainer="Sidd Pill"
ENV USER=flask
COPY ./requirements.txt .

RUN pip install -r requirements.txt &&  adduser -HDs /bin/sh $USER 


COPY src /src/
RUN chown -R $USER:$USER /src

EXPOSE 5000
USER $USER
ENTRYPOINT ["python", "/src/app.py"]
