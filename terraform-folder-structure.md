terraform/
|-- environments/
|   |-- dev/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   |-- outputs.tf
|   |-- qa/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   |-- outputs.tf
|   |-- prod/
|       |-- main.tf
|       |-- variables.tf
|       |-- outputs.tf
|-- modules/
|   |-- iam/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- s3/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- ec2/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- rds/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- glue/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- athena/
|       |-- main.tf
|       |-- variables.tf
|       |-- outputs.tf
|-- scripts/
|   |-- ec2_scripts/
|       |-- py-script.py
|       |-- sh-script.sh
