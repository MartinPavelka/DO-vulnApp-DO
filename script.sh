#!/bin/bash
## update repositories
sudo apt update
## install openjdk (requirements for solr)
apt-get install openjdk-8-jdk -y
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
