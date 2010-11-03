#!/bin/bash

cd script
# Iniciando Firewall 
./firewall start

# Iniciando Server
ruby server 

# Finalizando el Firewall
./firewall stop

