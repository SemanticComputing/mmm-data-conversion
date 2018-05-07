#!/bin/bash
docker-compose down \
  && docker volume rm mmmsdbmdata_mmm-crm \
  && docker-compose build crm \
  && docker-compose up -d input \
  && sleep 5 \
  && docker-compose run --rm crm ./convert.sh \
  && docker-compose up -d crm