First, clone the connector source code and build it.

  mkadir sandbox
  git clone https://github.com/trustpilot/kafka-connect-dynamodb
  cd kafka-connect-dynamodb
  ./gradlew shadowJar

This will produce a jar file. But Confluent Hub (and Kafka Connect) requires
a manifest file to properly deploy. This manifest format is documented at

https://docs.confluent.io/platform/current/connect/confluent-hub/component-archive.html

For connectors built with maven, there's a maven target which generates these packages for you.

Unfortunately, this connector is built with gradle, so we'll manually generate
the package. Copy the jar file containing the build output to the 
lib directory of the package manifest:

  cp build/libs/*.jar ../../../../kafka-connect-dynamodb/kafka-connect-dynamodb/lib

Then zip the whole thing up:

  cd ../../../../kafka-connect-dynamodb/
  zip kafka-connect-dynamodb.zip kafka-connect-dynamodb/

Now you have a connector manifest which can be uploaded to either your local
connect installation or to Confluent Cloud.
