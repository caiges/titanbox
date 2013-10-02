#!/bin/bash

echo 'Starting Titan'
cd /usr/local/titan
exec bin/titan.sh config/titan-server-rexster.xml config/titan-server-cassandra.properties