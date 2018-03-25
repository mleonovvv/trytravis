#!/bin/bash
gcloud compute instances create reddit-app-full \
 --boot-disk-size=10GB \
 --image=reddit-full-1522010322 \
 --machine-type=g1-small \
 --tags=puma-server \
 --restart-on-failure
