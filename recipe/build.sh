# Update the version in pom files (remove SNAPSHOT)
cd parent
mvn versions:set versions:update-child-modules -DnewVersion=${PKG_VERSION} -DprocessAllModule -DgenerateBackupPoms=false -Prelease
cd ..

# Skip the tests because they require to have a tango database running
mvn install -DskipTests

# Generate third party license report
mvn license:aggregate-third-party-report
cp target/reports/aggregate-third-party-report.html .
