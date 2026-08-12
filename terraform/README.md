\# AWS Static Website Infrastructure with Terraform



\## Overview



This project uses Terraform to provision and manage AWS infrastructure for a static website.



The project focuses on practical Terraform concepts including AWS resources, variables, outputs, data sources, modules, remote state management, state refactoring, and Git/GitHub.



\## AWS Services



\- Amazon S3

\- Amazon CloudFront

\- CloudFront Origin Access Control (OAC)

\- AWS IAM

\- Amazon S3 for Terraform remote state



\## Architecture



```text

User

&#x20; |

&#x20; v

CloudFront

&#x20; |

&#x20; | OAC

&#x20; v

Amazon S3

&#x20; |

&#x20; +-- index.html

&#x20; +-- style.css

&#x20; +-- JavaScript

```



\## Terraform Concepts



\- Resources

\- Variables

\- Outputs

\- Data sources

\- `for\_each`

\- Modules

\- Module inputs and outputs

\- Remote state

\- S3 backend

\- State management

\- `moved` blocks

\- Terraform validation

\- Terraform plan and apply



\## Project Structure



```text

terraform/

├── backend.tf

├── cloudfront.tf

├── main.tf

├── outputs.tf

├── providers.tf

├── s3.tf

├── variables.tf

├── .terraform.lock.hcl

├── modules/

│   └── s3/

│       ├── main.tf

│       ├── outputs.tf

│       └── variables.tf

└── website/

&#x20;   ├── index.html

&#x20;   ├── style.css

&#x20;   └── js/

```



\## Terraform Workflow



```bash

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply

```



\## Remote State



Terraform state is stored remotely in an Amazon S3 bucket.



The state bucket uses:



\- S3 versioning

\- Server-side encryption

\- Terraform S3 backend



Terraform state files are excluded from Git using `.gitignore`.



\## Git



The project is managed using Git and stored in GitHub.



Terraform-generated files such as `.terraform/` and Terraform state files are excluded using `.gitignore`.



\## Project Status



\*\*Completed\*\*



\- Terraform configuration

\- S3 infrastructure

\- S3 versioning

\- S3 encryption

\- Remote Terraform backend

\- Terraform modules

\- CloudFront configuration

\- CloudFront Origin Access Control

\- Git/GitHub



\## Learning Outcomes



This project provided hands-on experience with Terraform infrastructure as code, AWS resource management, reusable modules, remote state, state management, resource refactoring, and Git-based infrastructure management.

