#!/bin/bash

aws s3 ls | cut -d' ' -f3 | while read LINE; do

  SIZE=$(aws s3 ls s3://$LINE --recursive | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024" MB"}')

  printf '# %-70s %-10s \n' "${LINE}" "${SIZE}"

done

# amplify-deepracer-board-dev-113355-deployment                397.013 MB
# aws-deepracer-21f6da89-48ac-42b5-ac79-df2c2d8c771a           40701.9 MB
# aws s3 rb --force s3://aws-deepracer-51611837-dbb1-4274-961d-f9b7b71efab4           82562.5 MB
# aws s3 rb --force s3://aws-deepracer-76e506f1-7858-4248-9d7c-a4c6488e1c35           154245 MB
# aws s3 rb --force s3://aws-deepracer-a2ad4341-dd91-4cb6-b3fb-82152e268d3e           120556 MB
# aws s3 rb --force s3://aws-deepracer-c426b9fe-de07-4492-959a-0e55f21bd7d5           80577.3 MB
# awsrobomakercloudwatch-154406030631-bundlesbucket-18r6qn68zkfpu 20984.7 MB
