##
## Google Debian + CA
##
INSTALL:=/usr/local/share/ca-certificates
TAG:=tekii/debian:wheezy
USER:=root
GROUP:=root

##
## M4
##
M4= $(shell which m4)
M4_FLAGS= -P \
	-D __INSTALL__=$(INSTALL) \
	-D __USER__=$(USER) \
	-D __TAG__=$(TAG)

#.SECONDARY
Dockerfile: Dockerfile.m4 Makefile
	$(M4) $(M4_FLAGS) $< >$@

PHONY += image
image: Dockerfile
	docker build -t $(TAG) .

PHONY += push-to-google
push-to-google: docker-image
	docker tag $(TAG) gcr.io/mrg-teky/debian:wheezy
	gcloud docker push gcr.io/mrg-teky/debian:wheezy

PHONY += clean
clean:

PHONY += realclean
realclean: clean

PHONY += all
all: image

.PHONY: $(PHONY)
.DEFAULT_GOAL := all
