.PHONY: install
install:
	npm ci

.PHONY: test
test: lint npm-test validate

.PHONY: lint
lint:
	helm lint ./charts/*

.PHONY: validate
validate:
	./validate_manifest.sh

.PHONY:
helm-dep:
	@for dir in $(shell ls charts/); do helm dep update charts/$${dir}; done

.PHONY: npm-test
npm-test:
	npm run test

.PHONE: update-snapshot
update-snapshot:
	npm run update-snapshot
