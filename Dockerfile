FROM alpine:latest

RUN apk add --no-cache git bash

RUN mkdir -p /app

WORKDIR /app

RUN git clone --branch main https://<enter personal token here>@github.com/RomeoFrancoBarro/shift_schedule.git /app

RUN echo "Contents of /app after cloning:" && ls -la /app

RUN chmod 700 shift_sched.sh

RUN echo -e "#!/bin/sh\n./shift_sched.sh\nexec /bin/sh" > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
