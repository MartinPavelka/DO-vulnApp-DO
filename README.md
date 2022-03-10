# Prerequisites
This script is prepared to be run with a digital ocean image of ubuntu 20.04 (LTS) x64 (maybe 18.04)

My expectations are, that it shall automatically install, configure and enable a vulnerable Apache Solr application
This application shall be run under an unprivileged account and for the means of training, privilege escalation vectors shall be present on the system (thinking about a cronjob run under root privileges or something to make use of improper SUID configuration... we'll see.

For now, let's stop writing about it and start working on the script.

Vulnerable server, run:
```
set -e
curl -s -S -L https://raw.githubusercontent.com/MartinPavelka/DO-vulnApp-DO/main/script.sh | bash
```
