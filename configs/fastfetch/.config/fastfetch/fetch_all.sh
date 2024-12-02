#!/bin/bash

for i in $(seq 2 23);
do
     wget https://raw.githubusercontent.com/fastfetch-cli/fastfetch/dev/presets/examples/$i.jsonc 
done

