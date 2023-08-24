. ./ccloud-env

DOCKER_TEMPLATE=docker-compose-ccloud-connect.yml.template

DYNAMODB_TEMPLATE=./create-dynamodb-connector.sh.template
DYNAMODB_OUT=./create-dynamodb-connector.sh

#
# Generate docker-compose file which specificies your confluent cloud cluster
#

cat $DOCKER_TEMPLATE | \
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > docker-compose-ccloud-connect.yml

#
# Generate dynamodb connect configuration that specifies this confluent cloud cluster
#

cat $DYNAMODB_TEMPLATE | 
 sed -e "s^%AWS_REGION%^$AWS_REGION^g" \
     -e "s^%AWS_ACCESS_KEY%^$AWS_ACCESS_KEY^g" \
     -e "s^%AWS_SECRET_KEY%^$AWS_SECRET_KEY^g" > $DYNAMODB_OUT 
