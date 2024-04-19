mkdir -p ${PREFIX}/share/tango

# Install the logback.xml and logback-server.xml configuration files used by java applications for logging
install -m 0644 ${RECIPE_DIR}/logback*.xml ${PREFIX}/share/tango
