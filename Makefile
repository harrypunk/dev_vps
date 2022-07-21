.PHONY: prod dev planprod

prod:
	terraform apply -var-file=prod.tfvars

planprod:
	terraform plan -var-file=prod.tfvars

dev:
	terraform apply -var-file=dev.tfvars
