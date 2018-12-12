#
# MakeFile Terraform
# By James Woolfenden
#
.PHONY: clean

init:
	rm .terraform/modules/ -fr
	terraform init
clean:
	echo "Hello"
plan: init
	terraform plan
