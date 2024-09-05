FROM python:3.8-slim

RUN mkdir -p /home/snap7 \
    && chmod 755 /home/snap7

RUN pip install python-snap7[cli]

WORKDIR /home/

CMD ["/bin/sh", "-c", "python3 -u -m snap7.server --port 10201 >> /home/snap7/snap_seven.log 2>&1"]
