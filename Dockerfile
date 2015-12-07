FROM golang:1.4

MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2015-12-07

# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano

