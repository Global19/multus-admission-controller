#!/usr/bin/env bash
set -e

ORG_PATH="github.com/K8sNetworkPlumbingWG"
REPO_PATH="${ORG_PATH}/net-attach-def-admission-controller"

if [ ! -h gopath/src/${REPO_PATH} ]; then
	mkdir -p gopath/src/${ORG_PATH}
	ln -s ../../../.. gopath/src/${REPO_PATH} || exit 255
fi

export GOBIN=${PWD}/bin
export GOPATH=${PWD}/gopath

echo "Building admission controller"
# go install ${REPO_PATH}/...
go build -o /go/bin/installer ${REPO_PATH}/pkg/installer
go build -o /go/bin/webhook ${REPO_PATH}/pkg/webhook
chmod +x /go/bin/installer
chmod +x /go/bin/webhook
# go install ./...


