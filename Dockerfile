FROM sequenceiq/spark:1.6.0

# ADD yarn-remote-client/yarn-site.xml $SPARK_HOME/yarn-remote-client/yarn-site.xml
RUN echo 'slave1' >> $HADOOP_CONF_DIR/slaves
RUN echo 'slave2' >> $HADOOP_CONF_DIR/slaves