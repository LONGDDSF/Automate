#!/bin/sh

PROJECT_NAME=${PWD##*/}

lin=`sed -n -e "/if ENV\['use_code'\]/=" ${PROJECT_NAME}.podspec`
echo $lin


sed -i '1a test test' ${PROJECT_NAME}.podspec
#sed -i '1d' ${PROJECT_NAME}.podspec
#sed -i "${lin}/a\if ENV['use_code'] or if ENV[s.name+'_use_code']" ${PROJECT_NAME}.podspec
