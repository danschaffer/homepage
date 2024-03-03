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
bundle exec jekyll build

# docker
#docker build -t jekyll .

#echo "building site..."
#docker run -v $(pwd):/app jekyll

echo "copying site to s3..."
cd _site
aws s3 sync --quiet . s3://www.danschaffer.info

echo "invalidating cloudfront distribution..."
DIST_ID=$(aws cloudfront list-distributions | jq -r '.DistributionList.Items[0].Id')
aws cloudfront create-invalidation --distribution-id $DIST_ID --paths "/" | jq .

echo "done"
