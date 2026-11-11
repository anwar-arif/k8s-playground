# terraform base env

- this `variables.tf` file is the common variables across the aws infra
- use the `variables.tf` file in the terraform folders, as `shared_variables.tf` &rarr; `ln -s ../base-env/variables.tf shared_variables.tf`