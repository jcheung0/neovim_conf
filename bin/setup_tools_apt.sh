#/bin/bash


sudo apt-get update -y 

deps=('ripgrep' 'hello')


echo "${deps[*]}"

sudo apt-get install ${deps[*]} -y



