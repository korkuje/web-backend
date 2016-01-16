source 'https://rubygems.org'
ruby '2.3.0'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# temporary rails from github for heroku deploy
gem 'rails', github: "rails/rails"# , '>= 5.0.0.beta1', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma'

gem 'active_model_serializers', '~> 0.9.3'
# form objects
gem 'virtus', '~> 1.0.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec_api_documentation'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'factory_girl_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails_12factor', group: :production
