# demo-IAC
This branch contains terraform code to infrastructure on aws

## prerequisites
1. Create openID connector by using this Doc 
https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services
2. Create role and trust policy mentioned in above doc. This role will by used by github to connect to aws
3. Create iam role to be used by terraform to provision infrastructure for example is have created `terraform-deployment-role`
4. Create github secrets to be used in workflow for-example I have created `AWS_ACCOUNT_ID` , `AWS_REGION` , `BACKEND_IAM_ROLE` ,`GH_IAM_ROLE`
5. Create s3 bucket and dynamodb table to configure the backend for each environment

## How to run workflow
1. Go to `Actions` in github repo and click on `IAC workflow`
2. Pass the path for your terraform configurations


## Things to consider for future
1. we can configure workflow to input `AWS_ACCOUNT_ID` , `AWS_REGION` if we have multiple accounts and regions
2. Incase `AWS_ACCOUNT_ID` is different then create new deployment roles mentioned in prerequisites and take them using input in github actions 