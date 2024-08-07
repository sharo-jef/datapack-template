#!/bin/bash
read -p 'namespace: ' ns
if [ -z "$ns" ]; then
    echo 'Invalid namespace' 1>&2
    exit 1
fi
read -p 'description: ' desc

sed -i -e "s/Description here/$desc/g" pack.mcmeta
sed -i -e "s/namespace/$ns/g" data/minecraft/tags/function/load.json
sed -i -e "s/namespace/$ns/g" data/minecraft/tags/function/tick.json
sed -i -e "s/namespace/$ns/g" data/namespace/function/load/.mcfunction
sed -i -e "s/namespace/$ns/g" data/namespace/function/tick/.mcfunction
sed -i -e "s/namespace/$ns/g" data/namespace/function/uninstall/.mcfunction
mv data/namespace/ data/$ns
