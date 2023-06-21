AUTHOR?=imanuelchandra
REPOSITORY?=debian12systemd

.PHONY: build
build:
	docker build -t ${AUTHOR}/${REPOSITORY}:latest  .
	@echo
	@echo "Build finished. Docker image name: \"${AUTHOR}/${REPOSITORY}:latest\"."

.PHONY: run
run:
	docker run -ti --rm \
		--tty \
		--privileged --cap-add SYS_ADMIN --security-opt seccomp=unconfined \
		--cgroup-parent=docker.slice --cgroupns private \
		--tmpfs /tmp --tmpfs /run --tmpfs /run/lock \
		${AUTHOR}/${REPOSITORY}