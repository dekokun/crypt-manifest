#!/bin/bash

set -ex

docker buildx build --platform linux/arm64 . -f Dockerfile -t mackerel-agent-arm-bitcoin

docker tag mackerel-agent-arm-bitcoin:latest 185743233732.dkr.ecr.ap-northeast-1.amazonaws.com/mackerel-agent-arm-bitcoin:latest

aws ecr --profile=dekokun get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 185743233732.dkr.ecr.ap-northeast-1.amazonaws.com
docker push 185743233732.dkr.ecr.ap-northeast-1.amazonaws.com/mackerel-agent-arm-bitcoin:latest
