#!/usr/bin/env bash

set -e

# Binary paths
ECHO=$(which echo)
GIT=$(which git)
LS=$(which ls)
RM=$(which rm)
CP=$(which cp)
MKDIR=$(which mkdir)

${ECHO} "Configuring git to clone only over HTTPS..."
${GIT} config --global url."https://${GITHUB_ACCESS_TOKEN}@github.comcast.com/".insteadOf "ssh://git@github.comcast.com/"

${ECHO} "Defining endpoint for cf-tools repo..."
CF_TOOLS_REPO=https://${GITHUB_ACCESS_TOKEN}@github.comcast.com/dhx/cf-tools.git

# checkout scripts from cf-tools repo
${GIT} clone "${CF_TOOLS_REPO}"
${ECHO} "Cloned repo: ${CF_TOOLS_REPO}"

if [ -d "${WORKSPACE}/manifest" ]; then
  ${ECHO} "Manifest directory already exists. Deleting it."
  ${RM} -rf "${WORKSPACE}/manifest"
fi

${ECHO} "Copying scripts from: cf-tools/mortar/scripts to: ${WORKSPACE}/src/scripts/*"
${CP} -rf cf-tools/mortar/scripts/* "${WORKSPACE}/src/scripts/"

${LS} -al "${WORKSPACE}/src/scripts"

${ECHO} "Creating directory: ${WORKSPACE}/manifest"
${MKDIR} "${WORKSPACE}/manifest"

${ECHO} "Copying manifests from: cf-tools/manifest/${MORTAR_PROJECT} to: ${WORKSPACE}/manifest"
${CP} -rf cf-tools/manifest/${MORTAR_PROJECT}/* "${WORKSPACE}/manifest/"

${LS} -al "${WORKSPACE}/manifest"

${ECHO} "Deleting cf-tools"
${RM} -rf cf-tools

exit 0
