FROM python:3.7-alpine3.15

COPY src/ /app

WORKDIR /app

RUN pip3 install -r requirements.txt

RUN --mount=type=secret,id=cf_api_key cat /run/secrets/cf_api_key

ENV ZONE_ID="" \
    EMAIL="" \
    AUTH_KEY="/run/secrets/cf_api_key" \
    RECORD_ID="none" \
    CHECK_INTERVAL=86400
    
ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
