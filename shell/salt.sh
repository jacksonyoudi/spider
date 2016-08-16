#!/bin/bash



salt   '*'   cmd.run  'mkdir /opt/shell-jackson'
salt-cp  '*' intrusion_detection.sh  /opt/shell-jackson
salt '*'  cmd.run 'bash /opt/shell-jackson/intrusion_detection.sh'  |tee intrusion_detection`date +%F-%H`.txt
