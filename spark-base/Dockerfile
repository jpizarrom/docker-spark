FROM sequenceiq/spark:1.6.0

# update boot script
ONBUILD COPY bootstrap.sh /etc/bootstrap.sh
ONBUILD RUN chown root.root /etc/bootstrap.sh
ONBUILD RUN chmod 700 /etc/bootstrap.sh

ONBUILD COPY slaves $HADOOP_PREFIX/etc/hadoop/slaves
ONBUILD COPY yarn-remote-client/core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
ONBUILD COPY yarn-remote-client/yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

ENTRYPOINT ["/etc/bootstrap.sh"]
