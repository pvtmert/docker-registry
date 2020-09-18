#!/usr/bin/env bash

CERT_FILE=ssl
CERT_SIZE=4096
CERT_DAYS=3650
CERT_HOST=${1?: you need to specify hostname (CN)}

/usr/bin/openssl req \
	-new    \
	-x509   \
	-sha256 \
	-nodes  \
	-set_serial "$((RANDOM))"  \
	-newkey "rsa:${CERT_SIZE}" \
	-keyout "${CERT_FILE}.key" \
	-out    "${CERT_FILE}.crt" \
	-days   "$((CERT_DAYS))"   \
	-subj   "/CN=${CERT_HOST}"
