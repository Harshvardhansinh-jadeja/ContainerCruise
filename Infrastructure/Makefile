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
	if [ ${push} = true ]; then\
        terraform apply -auto-approve ; \
    fi