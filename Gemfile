source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "6.0.2.1"
# Use postgresql as the database for Active Record
gem "pg", "1.2.2"
# Use Puma as the app server
gem "puma", "4.3.1"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "2.9.1"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "1.4.5", require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors", "1.1.1"
# adding error tracker
gem "honeybadger", "~> 4.0"
# encrypting password
gem "bcrypt", "3.1.13"
# for jwt
gem "jwt", "2.2.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", "11.1.0", platforms: [:mri, :mingw, :x64_mingw]
  # For rspec testing
  gem "rspec-rails", "3.9.0"
  gem "factory_bot_rails", "5.1.1"
end

group :development do
  gem "listen", "3.2.1"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "2.1.0"
  gem "spring-watcher-listen", "2.0.1"
  gem "spring-commands-rspec", "1.0.4"
  # to view emails in browser
  gem "letter_opener", "1.7.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", "1.2019.3", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
