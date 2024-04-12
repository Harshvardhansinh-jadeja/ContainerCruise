.DEFAULT_GOAL := hello_world

# export TF_VAR_profile
export TF_VAR_environment=sandbox
export ssm_env?=sandbox
export ssm_prefix?=/harshvardhan/${ssm_env}/rds/
INFRA:= Infrastructure
DOCKER:= auth

hello_world:
	@echo "Hello world"

Infra_Plan: workspace format validate plan 

# init workspace format validate plan apply:
# 	@cd Infrastructure/

init:
	terraform init

workspace : 
	terraform workspace select ${workspace} 

format:
	terraform fmt -recursive

validate:
	terraform validate

plan:
	terraform plan

apply:
	 terraform apply -auto-approve

docker: image_build image_push

image_build:
	@docker build -t ${name} ${path}

image_push:
	@docker push ${name}

ssm:
	@bash ./scripts/ssm.sh

ssm_param:
ifeq ($(profile),)
	@aws --region=us-west-2 ssm get-parameter --name ${ssm_prefix}${param} --with-decryption --output text --query Parameter.Value 
else
	@aws --region=us-west-2 --profile $(profile) ssm get-parameter --name ${ssm_prefix}${param} --with-decryption --output text --query Parameter.Value
endif

ecr:
ifeq ($(profile),)
	@aws ecr describe-repositories --repository-names $(name)
else
	@aws ecr describe-repositories --repository-names $(name) --profile $(profile)
endif

push: status add commit git_push

status:
	git status

add:
	git add .

commit:
	git commit -m "$(message)"

git_push:
	git push origin $(branch)