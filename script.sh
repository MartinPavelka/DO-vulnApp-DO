#!/bin/bash
## update repositories
sudo apt update
## install java 8u181 (requirements for solr)
mkdir /usr/java
cd /usr/java
wget https://repo.huaweicloud.com/java/jdk/8u181-b13/jdk-8u181-linux-x64.tar.gz
tar xzvf jdk-8u181-linux-x64.tar.gz
update-alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_181/bin/java 100
update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_05/bin/javac 100
cd ~/
## Download vulnerable Solr 8.11.0
cd /opt
wget https://archive.apache.org/dist/lucene/solr/8.11.0/solr-8.11.0.tgz
## unpack install and configure solr
tar xzf solr-8.11.0.tgz
bash solr-8.11.0/bin/install_solr_service.sh solr-8.11.0.tgz
su - solr -c "/opt/solr/bin/solr create -c mytestcollection -n data_driven_schema_configs"
## Set authentication - password SolrRocks
cd /opt/solr/server
wget https://raw.githubusercontent.com/MartinPavelka/DO-vulnApp-DO/main/security.json
cp security.json /var/solr/.
cp security.json /var/solr/data/.
systemctl restart solr
