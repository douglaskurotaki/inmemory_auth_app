source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.1'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
gem 'redis', '>= 4.0.1'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
# Front-end framework for developing responsive, mobile-first projects [https://github.com/twbs/bootstrap-rubygem]
gem 'bootstrap', '~> 5.3.3'
# Use Rack middleware to add CORS headers [https://github.com/rack/rack]
gem 'rack'
# Use Rack middleware to add CORS headers [https://github.com/sass/sassc-rails]
gem 'sassc-rails'
# Use Rack middleware to add CORS headers [https://github.com/bcrypt-ruby/bcrypt-ruby]
gem 'bcrypt'
# Use faraday to make HTTP requests [https://github.com/lostisland/faraday]
gem 'faraday'
# Use dotenv to load environment variables from .env into ENV in development [https://github.com/bkeepers/dotenv]
gem 'dotenv-rails'
# Use terser as compressor for JavaScript assets [https://github.com/ahorek/terser-ruby]
gem 'terser'
# Use ostruct to build data structures [https://github.com/ruby/ostruct]
gem 'ostruct'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false
end

group :test do
  # JSON formatter for SimpleCov output
  gem 'simplecov'
  # Testing framework for Rails [https://github.com/rails/rails-controller-testing]
  gem 'rails-controller-testing'
  # Testing framework for Rails [https://github.com/rspec/rspec-rails]
  gem 'rspec-rails'
  # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionalities
  gem 'shoulda-matchers'
  # Stubs and sets expectations on HTTP requests
  gem 'webmock'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
end

gem 'dockerfile-rails', '>= 1.6', group: :development
