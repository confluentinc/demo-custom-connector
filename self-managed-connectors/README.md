Make your own ccloud-env file:

cp ccloud-env.template ccloud-env

Edit ccloud-env with the required information.

Run ccloud-env.sh

This will create:
-A docker-compose-ccloud-connect.yml file that will spin up a kafka-connect
worker node that can connect to Confluent Cloud
-A create-dynamodb-connector.sh that will upload the install and configure
the dynamodb connector in your local connect worker.

Copy the manifest zip file from kafka-connect-dynamodb to the files directory
so it is picked up by the docker container

Now spin up the images in docker:

docker-compose -f ./docker-compose-ccloud-connect.yml up

To install the dynamoDB connector, run:

./create-dynamodb-connector.sh

To check its status, run:

check-connectors.sh
or
debug-connectors.sh

 
