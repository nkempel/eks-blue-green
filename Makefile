.SILENT:

help:
	{ grep --extended-regexp '^[a-zA-Z0-9._-]+:.*#[[:space:]].*$$' $(MAKEFILE_LIST) || true; } \
	| awk 'BEGIN { FS = ":.*#[[:space:]]*" } { printf "\033[1;32m%-17s\033[0m%s\n", $$1, $$2 }'

setup: # npm install + terraform init + create ecr repository
	bash ./make.sh setup

dev: # local development
	bash ./make.sh dev

local-1.0.0: # local 1.0.0 version — blue parrot
	bash ./make.sh local-1.0.0

local-1.1.0: # local 1.1.0 version — green parrot
	bash ./make.sh local-1.1.0

local-1.2.0: # local 1.2.0 version — red parrot
	bash ./make.sh local-1.2.0

build-all: # build all 1.x.0 versions
	bash ./make.sh build-all

push-all: # push all 1.x.0 versions to ecr
	bash ./make.sh push-all

tf-validate: # terraform validate
	bash ./make.sh tf-validate

tf-apply: # terraform plan + terraform apply
	bash ./make.sh tf-apply

kube-config: # setup kubectl config
	bash ./make.sh kube-config

k8s-1.0.0: # publish the 1.0.0 version
	bash ./make.sh k8s-1.0.0

k8s-1.1.0-green: # publish the 1.1.0 version as green
	bash ./make.sh k8s-1.1.0-green

k8s-1.1.0: # target the 1.1.0 version — new blue
	bash ./make.sh k8s-1.1.0

k8s-delete-1.0.0: # delete previous blue deployment + green service
	bash ./make.sh k8s-delete-1.0.0

k8s-1.2.0-green: # publish the 1.2.0 version as green
	bash ./make.sh k8s-1.2.0-green

k8s-1.2.0: # target the 1.2.0 version — new blue
	bash ./make.sh k8s-1.2.0

destroy: # delete eks content + terraform destroy + delete ecr repository
	bash ./make.sh destroy