#!/bin/bash
sed "s/tagVersion/$1/g" depl.yaml > mydep.yaml
