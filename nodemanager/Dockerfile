FROM sequenceiq/spark:1.6.0

# update boot script
COPY bootstrap.sh /etc/bootstrap-nodemanager.sh
RUN chown root.root /etc/bootstrap-nodemanager.sh
RUN chmod 700 /etc/bootstrap-nodemanager.sh

COPY slaves $HADOOP_PREFIX/etc/hadoop/slaves
COPY yarn-remote-client/core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
COPY yarn-remote-client/yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

ENTRYPOINT ["/etc/bootstrap-nodemanager.sh"]
