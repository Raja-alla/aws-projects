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

