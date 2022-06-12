install:
	bundle install

lint:
	bundle exec rubocop lib

test:
	bundle exec rake test

push:
	./git.sh $(commit)

.PHONY: test
