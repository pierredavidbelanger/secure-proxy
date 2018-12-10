build:
	docker build -t pierredavidbelanger/secure-proxy .
push: build
	docker push pierredavidbelanger/secure-proxy