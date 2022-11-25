#!/bin/bash

docker run --rm --interactive --tty \
	--volume=/home/paul/dev/test-stuff:/home/build/rack-plugin-toolchain/test-stuff \
	--env PLUGIN_DIR=test-stuff \
	ghcr.io/qno/rack-plugin-toolchain-win-linux:latest \
	/bin/bash

	#rack-plugin-toolchain:$(DOCKER_IMAGE_VERSION) \
