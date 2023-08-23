# Cognitive Services Account Creation
Terraform for creating the infrastructure/platform resources for Cognitive Services Account

## Install
Terraform 1.3.9 or above

## Terraform Commmands
### Workspace setup
please make sure the workspaces have not already been configured before running any of the create commands.
```
# confirm
terraform workspace list

# create
terraform init
terraform workspace new dev
```

### Dev

```bash
terraform workspace select dev
terraform plan -var-file=terraform.tfvars -out="$(terraform workspace show).tfplan"
terraform apply "$(terraform workspace show).tfplan"
```

# Destroy
```bash
terraform plan -destroy -var-file=terraform.tfvars -out="$(terraform workspace show).tfplan"
terraform apply "$(terraform workspace show).tfplan"
```

