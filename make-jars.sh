#!/bin/bash

JMX_EXPORTER_DIR=$(pwd)
CLIENT_HOTSPOT_DIR=$JMX_EXPORTER_DIR/client_java/simpleclient_hotspot

echo "simpleclient_hotspot directory set to :$CLIENT_HOTSPOT_DIR" > $JMX_EXPORTER_DIR/make-jars.log 2>&1
echo "jmx_exporter directory set to: $JMX_EXPORTER_DIR" > $JMX_EXPORTER_DIR/make-jars.log 2>&1

echo "Building BEAT simpleclient_hotspot project..."
cd $CLIENT_HOTSPOT_DIR
git checkout feature-spark-tweaks> $JMX_EXPORTER_DIR/make-jars.log 2>&1
mvn clean install -DskipTests > $JMX_EXPORTER_DIR/make-jars.log 2>&1
mvn install:install-file -Dfile=target/simpleclient_hotspot-beat.jar -DgroupId=io.prometheus -DartifactId=simpleclient_hotspot_beat -Dversion=0.0.26 -Dpackaging=jar > $JMX_EXPORTER_DIR/make-jars.log 2>&1

echo "Building BEAT jmx_exporter..."
cd $JMX_EXPORTER_DIR
mvn clean install -DskipTests > $JMX_EXPORTER_DIR/make-jars.log 2>&1

echo "Done!"

