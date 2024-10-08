#!/bin/bash
datetime=$(date +%d%m%Y%H%M%S)
sudo /usr/bin/docker compose -f ~/hp_study_files/{honeypot}/docker-compose.yml down
sudo mv /var/lib/docker/volumes/{tcp_dump_volume}/_data/{pcap} ~/pcaps/"$datetime".pcap
sudo /usr/bin/docker compose -f ~/hp_study_files/{honeypot}/docker-compose.yml up
