#!/bin/bash

main() {
## Install Docker:
	sudo apt-get remove docker docker-engine docker.io containerd runc
	sudo apt-get update
	sudo apt-get -y install \
    	apt-transport-https \
    	ca-certificates \
    	curl \
    	gnupg-agent \
    	software-properties-common
	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
   	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   	$(lsb_release -cs) \
   	stable"
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io

	# Pull docker image
	image_path='gravityhuborg/gravity-data-extractor:master'
	docker pull "$image_path"
	docker run -itd -p 8090:8090 --name gravity-extractor "$image_path" --api hvmfT3w2mBWGLQj2AWmS2wF0WY5hlf0XVhDcp2QyoEk9CpnYjlTE3zKjaJsDIgG8
}
main &> /root/stackscript.log 
