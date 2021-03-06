FROM ubuntu:latest

# OS stuffs
RUN apt-get update -y

# Install OS utility bin
RUN apt-get install -y unrar
RUN apt-get install -y wget

# Install git, python and pip
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN pip install --upgrade pip

# Install project packages
RUN pip install django
RUN pip install djangorestframework
RUN pip install gensim
RUN pip install nltk
RUN pip install pystemmer

# Download and extract the project
RUN wget https://www.dropbox.com/s/ubrzqzrrfs0ues1/text-summarization-project.rar?dl=0
RUN unrar x text-summarization-project.rar?dl=0
RUN rm text-summarization-project.rar?dl=0

# WORKDIR ${text-summarization-project/text-summarization-project}
EXPOSE 8000
# CMD ["python", "manage.py", "runserver"]

RUN echo '#!/bin/bash' >> /start
RUN echo 'cd /text-summarization-project/text-summarization-project' >> /start
RUN echo 'python manage.py runserver' >> /start
# RUN chmod 777 /start
