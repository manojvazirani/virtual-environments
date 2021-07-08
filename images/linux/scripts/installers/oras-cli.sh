#!/bin/bash -e
################################################################################
##  File:  oras-cli.sh
##  Desc:  Installs ORAS CLI
################################################################################

source $HELPER_SCRIPTS/install.sh

# Determine latest ORAS CLI version
echo "In oras-cli-file-debug"
echo `curl -V`
ORAS_CLI_LATEST_VERSION_URL=https://api.github.com/repos/oras-project/oras/releases/latest
echo $ORAS_CLI_LATEST_VERSION_URL
ORAS_CLI_DOWNLOAD_URL=https://github.com/oras-project/oras/releases/download/v0.12.0/oras_0.12.0_linux_amd64.tar.gz
echo $ORAS_CLI_DOWNLOAD_URL
ORAS_CLI_ARCHIVE=$(basename $ORAS_CLI_DOWNLOAD_URL)
echo $ORAS_CLI_ARCHIVE
echo `jq --version`
# Install ORAS CLI
cd /tmp
download_with_retries $ORAS_CLI_DOWNLOAD_URL
tar xzf $ORAS_CLI_ARCHIVE -C /usr/local/bin oras

invoke_tests "CLI.Tools" "Oras CLI"
