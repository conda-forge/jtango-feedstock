# Update the version in pom files (remove SNAPSHOT)
cd parent
mvn versions:set versions:update-child-modules -DnewVersion=${PKG_VERSION} -DprocessAllModule -DgenerateBackupPoms=false -Prelease
cd ..

# Skip the tests because they require to have a tango database running
mvn install -DskipTests

# Generate third party license report
mvn license:aggregate-third-party-report
cp target/site/aggregate-third-party-report.html .

mkdir -p ${PREFIX}/share/java ${PREFIX}/share/tango

install -m 0644 assembly/target/JTango-${PKG_VERSION}.jar ${PREFIX}/share/java
ln -s JTango-${PKG_VERSION}.jar ${PREFIX}/share/java/JTango.jar

# Install the logback.xml and logback-server.xml configuration files used by java applications for logging
install -m 0644 ${RECIPE_DIR}/logback*.xml ${PREFIX}/share/tango
