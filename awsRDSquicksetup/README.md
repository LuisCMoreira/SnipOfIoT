# SnipOfIoT_awsRDSquicksetup
just a quick .sh to setup an RDS in AWS


to get endpoint in AWS CLI:

aws rds describe-db-instances --db-instance-identifier mydbinstance --query 'DBInstances[0].Endpoint.[Address,Port]' --output text
