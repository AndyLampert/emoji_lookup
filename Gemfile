source 'https://rubygems.org'


gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# custom

# in class
gem 'bcrypt'
gem 'rspec-rails'
gem 'guard-bundler'
gem 'guard-rspec'
gem 'factory_girl_rails'
gem 'capybara'

# from work
gem 'devise'
# turn off asset logging in dev

gem 'quiet_assets', :group => :development

# message queueing
gem 'resque', :require => 'resque/server'
gem 'resque-web', require: 'resque_web'
gem 'simple_form'
gem 'american_date'
# gem 'ajaxful_rating'
gem 'acts_as_commentable'
gem 'activerecord-colored_log_subscriber'
gem 'hirb' # used to output tables in the console. to enable: Hirb.enable, disable: Hirb.disable
gem 'squeel' # better activerecord queries

group :development, :test do
  # for heroku
  gem 'sqlite3'

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'

  # custom
  gem 'better_errors'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-byebug' # gives continue, next, step, etc. commandsend

end
group :test do
  gem 'faker'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

ruby '2.2.1'
