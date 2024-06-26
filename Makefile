setup:
	bin/setup
	bin/rails db:seed
	yarn

start:
	bin/dev

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

lint:
	bundle exec rubocop app
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop app -A

.PHONY: test
