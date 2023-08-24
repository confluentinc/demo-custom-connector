First, clone the connector source code and build it.

git clone https://github.com/trustpilot/kafka-connect-dynamodb

cd kafka-connect-dynamodb

./gradlew shadowJar

This will produce a jar file. But Confluent Hub (and Kafka Connect) requires
a manifest file to properly deploy. This manifest format is documented at


https://docs.confluent.io/platform/current/connect/confluent-hub/component-archive.html

And connectors there's a maven target which generates these packages for you.

Unfortunately, this connector is built with gradle, so we'll manually generate
the package. Copy the jar file containing the build output to the 
lib directory of the package manifest:

TODO

Then zip the whole thing up:

TODO

Now you have a connector manifest which can be uploaded to either your local
connect installation or to Confluent Cloud.
