# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


RUN 

duplicate file: 
	database.yml
	secrets.yml

Terminal 1
```
	bundle
	rails db:migrate
	rails db:seed
	rails s
```


Dev 
Open terminal 2
```
	bundle exec rake browser_sync:start
```

google-chrome --disable-web-security 