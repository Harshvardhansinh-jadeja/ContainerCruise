#!/bin/bash
# aws configure --profile ${AWS_PROFILE}  set aws_access_key_id $AWS_ACCESS_KEY_ID
# aws configure --profile ${AWS_PROFILE}  set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
# aws configure --profile ${AWS_PROFILE} set region ${AWS_REGION}


# aws configure --profile harsh  set aws_access_key_id 
# aws configure --profile harsh  set aws_secret_access_key 
# aws configure --profile harsh set region us-west-2

aws configure list
aws sts get-caller-identity