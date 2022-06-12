install:
	bundle install

lint:
	bundle exec rubocop lib

push:
	./git.sh $(commit)
