setup:
	bin/setup

lint:
	bundle exec rubocop -c .rubocop.yml
	bundle exec slim-lint app/views

spec:
	bundle exec rake test

server:
	bundle exec rails s

console:
	bundle exec rails c


