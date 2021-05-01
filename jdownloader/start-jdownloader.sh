#!/bin/bash
java -jar /JDownloader.jar
sleep 3;
while [ -n "$(ps -a | grep 'java')" ]; do
    sleep 1;
done