#!/bin/bash

SSM_USER=aws --region=us-west-2 ssm get-parameter --name "/harshvardhan/sandbox/rds/username" --with-decryption --output text --query Parameter.Value

echo "TF_VAR_username=${SSM_USER}" >> $GITHUB_ENV