.DEFAULT_GOAL := hello_world

hello_world:
	@echo "Hello world"

deploy: workspace  plan apply


init:
	terraform init

workspace : 
	terraform workspace select ${workspace} 

plan:
	terraform plan

apply:
	ifeq ($(push),true)
		terraform apply -auto-approve
	endif