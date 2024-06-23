#!/bin/bash

init(){
    terraform init 
}

plan(){
    terraform plan -var-file terraform.tfvars 
}

apply(){
    terraform apply -var-file terraform.tfvars -auto-approve 
}

destroy(){
    terraform destroy -auto-approve
}

if [ "$1" == "init" ]; then
    init
elif [ "$1" == "plan" ]; then
    plan
elif [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "destroy" ]; then
    destroy
else
    echo "Usage: $0 {init|plan|apply|destroy}"
fi