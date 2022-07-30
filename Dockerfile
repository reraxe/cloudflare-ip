FROM python:3.7-alpine3.15

COPY src/ /app

WORKDIR /app

RUN pip3 install -r requirements.txt

RUN chmod +x /app/secrets-entrypoint
    
ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh", "/app/secrets-entrypoint"]
