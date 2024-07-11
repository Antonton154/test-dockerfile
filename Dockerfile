FROM python:3.12-slim

ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /app

COPY . /app
RUN pip install --no-cache-dir -r requirements.txt



EXPOSE 8127

ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host=0.0.0.0"]