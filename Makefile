lint:
	bundle exec rubocop -c .rubocop.yml
	bundle exec slim-lint app/views

spec:
	bundle exec rake test


