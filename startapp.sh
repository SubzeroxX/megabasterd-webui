#!/bin/sh

# Define the Java System Property flag to set user.home to /output
JAVA_HOME_PROP="-Duser.home=/output"

# Execute the Java application, injecting the property before the -jar argument.
# This explicitly tells the JVM that the 'home' directory is /output.
exec java "$JAVA_HOME_PROP" -jar /defaults/megabasterd.jar