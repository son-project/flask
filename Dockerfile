FROM ubuntu:16.04
MAINTAINER Jihyung Song <bluese05@gmail.com>

# Set environment variables
ENV HOME_DIR="/opt/fc-sample"
ENV FLASK_APP="app.py"

# Install base packages
RUN apt-get update && apt-get install -y apt-utils python-pip git

# Install flask
RUN pip install flask pyyaml
COPY ./source ${HOME_DIR}

# Setting flask 
ADD flask.conf ${HOME_DIR}/flask.conf

WORKDIR ${HOME_DIR}

# Expose & Run flask server
EXPOSE 5000
CMD ["/usr/local/bin/flask", "run", "-h", "0.0.0.0"]

