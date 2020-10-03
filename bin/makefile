# check for required binaries, fail gracefully with helpful error message.
REQUIRED_BINS := docker
$(foreach bin,$(REQUIRED_BINS),\
    $(if $(shell command -v $(bin) 2> /dev/null),$(info Found `$(bin)`),$(error Please install `$(bin)`)))

# targets that are labeled as PHONY are treated as always needing an update
# a file doesn't actually need to exist for it to run
.PHONY: all clean \
	latex_image \
	publish path

# the first real target is the one used when no other arguments are passed to `make`
# by creating a dependency on the pdf, we trigger a compilation by default.
all: latex_image

# bare-bones dependencies to build image
latex_image: Dockerfile
	docker build -t latex:thesis -f Dockerfile .
	docker tag latex:thesis latex:latest

clean:
	docker system prune
