#!/bin/bash
read -p 'namespace: ' ns
read -p 'description: ' desc
sed -ie "s/Description here/$desc/g" ./pack.mcmeta
mv data/namespace/ data/$ns
sed -ie "s/namespace/$ns/g" ./data/minecraft/tags/functions/load.json
sed -ie "s/namespace/$ns/g" ./data/minecraft/tags/functions/tick.json
