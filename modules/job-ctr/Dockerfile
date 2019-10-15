FROM google/cloud-sdk:latest

WORKDIR /app

RUN apt-get update
RUN apt-get install -y python3-pip

ADD requirements.txt .
RUN pip3 install -r requirements.txt

ADD . .

ENTRYPOINT ["/app/entrypoint.sh"]

CMD [ "/app/cmd.sh" ]