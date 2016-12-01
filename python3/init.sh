#!/bin/bash

pushd /root > /dev/null

if [ -d "python3" ]; then
  echo "Python 3 seems to be installed. Exiting."
  return 0
fi

echo "Install Python"
wget --no-check-certificate https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
tar -xzf Python-3.5.2.tgz  
rm Python-*.tgz
mv `ls -d Python-* | grep -v ec2` python3

popd > /dev/null
