## Component Archive Example

This subdirectory is intended to hold the component archive we produce
after building the connector. It contains the required directory structure and a working
`manifest.json` file representing the `kafka-connect-dynamodb` connector from Trustpilot. 

## Build

Clone the connector source code and build it.
```
  mkdir sandbox
  git clone https://github.com/trustpilot/kafka-connect-dynamodb
  cd kafka-connect-dynamodb
  ./gradlew shadowJar
```

This will produce a jar file. But Confluent Hub (and Kafka Connect) requires
a manifest file to properly deploy. This manifest format is documented at

https://docs.confluent.io/platform/current/connect/confluent-hub/component-archive.html

For connectors built with maven, there's a maven target which generates these packages for you.

Unfortunately, this connector is built with gradle, so we'll manually generate
the package. 

## Package

Copy the jar file containing the build output to the 
`lib` directory of the component archive:

  `cp build/libs/*.jar ../../../../connector/kafka-connect-dynamodb/lib`

Then zip the whole thing up:

```
  cd ../../../../kafka-connect-dynamodb/
  zip kafka-connect-dynamodb.zip kafka-connect-dynamodb/
```

Now you have a component archive which can be uploaded to either your local
connect installation or to Confluent Cloud.
