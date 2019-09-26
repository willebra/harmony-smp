#!/bin/bash
#


#Define DOMAIN_HOME
echo "Domain Home is: " $DOMAIN_HOME


if [ ! -d "$DOMAIN_HOME/classes" ]; then
  mkdir -p "$DOMAIN_HOME/classes";
fi

if [ ! -d "$DOMAIN_HOME/bdmsl" ]; then
  mkdir -p "$DOMAIN_HOME/bdmsl";
fi


# create smp property file
echo "hibernate.dialect=org.hibernate.dialect.Oracle10gDialect" >> "$DOMAIN_HOME/classes/smp.config.properties"
echo "datasource.jndi=jdbc/cipaeDeliveryDs" >> "$DOMAIN_HOME/classes/smp.config.properties"
echo "log.folder=./logs/" >> "$DOMAIN_HOME/classes/smp.config.properties"
# create weblogic classpath to classes folder
echo "export CLASSPATH=\${CLASSPATH}:\${DOMAIN_HOME}/classes" >> "$DOMAIN_HOME/bin/setDomainEnv.sh"



# Deploy Application
wlst.sh -skipWLSModuleScanning /u01/oracle/smp-app-deploy.py
