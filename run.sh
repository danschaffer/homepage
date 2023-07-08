#!/bin/bash

echo "checking account"
aws sts get-caller-identity | jq . | grep kimba
if [ "$?" != "0" ]
then
  echo "ERROR account is not set to homepage"
  aws sts get-caller-identity | jq . 
  exit 1
fi

echo "building jekyll..."
docker build -t jekyll .

echo "building site..."
docker run -v $(pwd):/app jekyll

echo "copying site to s3..."
cd _site
aws s3 sync --quiet . s3://www.danschaffer.info

echo "invalidating cloudfront distribution..."
aws cloudfront create-invalidation --distribution-id E1IJN3GI590RST --paths "/*" | jq .

echo "done"