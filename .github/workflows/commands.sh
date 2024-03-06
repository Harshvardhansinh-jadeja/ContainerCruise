#!/bin/bash
aws configure --profile ${TF_VAR_profile}  set aws_access_key_id  $AWS_ACCESS_KEY_ID
aws configure --profile ${TF_VAR_profile}  set aws_secret_access_key  $AWS_SECRET_ACCESS_KEY
aws configure --profile ${TF_VAR_profile} set region ${TF_VAR_region}