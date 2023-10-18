#!/bin/bash

# Set variables
DB_INSTANCE_IDENTIFIER=mydbinstance
DB_INSTANCE_CLASS=db.t3.small
DB_ENGINE=postgres
DB_ENGINE_VERSION=12.8
DB_STORAGE_TYPE=io1
DB_STORAGE_SIZE=100
DB_IOPS=1000
VPC_ID=vpc-01112223334445550
ENABLE_AUTO_UPGRADE=false
MASTER_USERNAME=mydbuser
MASTER_PASSWORD=mydbpassword
DB_NAME=mydbname


# Get the VPC subnet IDs
SUBNET_IDS=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=$VPC_ID --query 'Subnets[].SubnetId' --output text | tr '\n' ',' | sed 's/,$>
# Create RDS instance
aws rds create-db-instance \
    --db-instance-identifier $DB_INSTANCE_IDENTIFIER \
    --db-instance-class $DB_INSTANCE_CLASS \
    --engine $DB_ENGINE \
    --engine-version $DB_ENGINE_VERSION \
    --storage-type $DB_STORAGE_TYPE \
    --allocated-storage $DB_STORAGE_SIZE \
    --iops $DB_IOPS \
    --no-vpc-security-group-ids \
    --db-subnet-group-name $DB_INSTANCE_IDENTIFIER \
    --no-auto-minor-version-upgrade \
    --no-enable-iam-database-authentication \
    --no-copy-tags-to-snapshot \
    --no-deletion-protection \
    --no-publicly-accessible \
    --no-multi-az \
    --master-username $MASTER_USERNAME \
    --master-user-password $MASTER_PASSWORD \
    --db-name $DB_NAME
