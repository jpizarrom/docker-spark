FROM sequenceiq/spark:1.6.0

# update boot script
COPY bootstrap.sh /etc/bootstrap-master.sh
RUN chown root.root /etc/bootstrap-master.sh
RUN chmod 700 /etc/bootstrap-master.sh

COPY slaves $HADOOP_PREFIX/etc/hadoop/slaves
COPY yarn-remote-client/core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
COPY yarn-remote-client/yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

ENTRYPOINT ["/etc/bootstrap-master.sh"]
