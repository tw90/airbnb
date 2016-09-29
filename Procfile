web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker bundle exec sidekiq -q default -q mailer -c 5