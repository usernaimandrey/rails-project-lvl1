install:
	bundle install

push:
	./git.sh $(commit)
