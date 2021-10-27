source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 5.2.6'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem "font-awesome-rails"
gem 'jquery-rails'
gem 'devise'
gem 'devise-i18n'
gem 'russian'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'twitter-bootstrap-rails'
gem 'carrierwave'
gem 'rmagick'

gem 'fog-aws'



group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
