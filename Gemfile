source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.1'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'language_detection', '~> 0.0.2'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.2', '>= 2.2.1'
gem 'simple_command', '~> 0.1.0'
gem 'cancancan', '~> 3.0', '>= 3.0.1'
gem 'active_model_serializers', '~> 0.10.10'

group :development, :test do
  gem 'pry', '~> 0.12.2'
  gem 'pry-nav', '~> 0.3.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
