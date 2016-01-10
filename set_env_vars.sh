#!/usr/bin/env bash

echo Defaults:root \!requiretty >> /etc/sudoers
INPUT_FILE=/opt/elasticbeanstalk/deploy/configuration/containerconfiguration
OUTPUT_FILE=/home/ec2-user/rds_env_vars.sh

rm -rf $OUTPUT_FILE 

echo "export RDS_PORT="` jq '.plugins.rds.env.RDS_PORT' $INPUT_FILE`  >> $OUTPUT_FILE
echo "export RDS_PASSWORD="` jq '.plugins.rds.env.RDS_PASSWORD' $INPUT_FILE`  >> $OUTPUT_FILE
echo "export RDS_USERNAME="` jq '.plugins.rds.env.RDS_USERNAME' $INPUT_FILE`  >> $OUTPUT_FILE
echo "export RDS_HOSTNAME="` jq '.plugins.rds.env.RDS_HOSTNAME' $INPUT_FILE`  >> $OUTPUT_FILE
echo "export RDS_DB_NAME="` jq '.plugins.rds.env.RDS_DB_NAME' $INPUT_FILE`  >> $OUTPUT_FILE

chmod +x $OUTPUT_FILE
source $OUTPUT_FILE

