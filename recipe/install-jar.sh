mkdir -p ${PREFIX}/share/java

install -m 0644 assembly/target/JTango-${JTANGO_VERSION}.jar ${PREFIX}/share/java
ln -s JTango-${JTANGO_VERSION}.jar ${PREFIX}/share/java/JTango.jar
