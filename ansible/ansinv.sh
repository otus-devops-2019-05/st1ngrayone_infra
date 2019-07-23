#!/bin/bash

if [[ $1 = "--list" ]] 
then
	/bin/cat ./inventory.json
fi
