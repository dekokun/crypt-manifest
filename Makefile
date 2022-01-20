.PHONY: test
test: lint npm-test

.PHONY: lint
lint:
	helm lint ./charts/*
.PHONY: npm-test
npm-test:
	npm run test
