install:
	bundle install

install-dev:
	bundle install --with development

install-test:
	bundle install --with test

lint:
	bundle exec rake rubocop

lint-fix:
	bundle exec rake rubocop:auto_correct

test:
	bundle exec rake test

push:
	./git.sh $(commit)

.PHONY: test
