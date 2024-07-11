FROM python:3.12-slim

ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /app

COPY .. /app
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && \
    apt-get install -y default-jre && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8127

ENV FLASK_APP=app.py


CMD ["flask", "run", "--host=0.0.0.0"]