build:
	docker build -t discover-nodejs-memory-limit .

run:
	docker run -it --memory=250m discover-nodejs-memory-limit
