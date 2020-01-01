all:

TAG = 1.0
PREFIX = opeo/simple-node

container:
	docker build --pull -t $(PREFIX):$(TAG) .

push: container
	docker push $(PREFIX):$(TAG)