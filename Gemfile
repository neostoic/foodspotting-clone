source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
#Fr Twitter Bootstrap
gem 'bootstrap-sass', '~> 3.0.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# CarrierWave gem. Read more: https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# RMagick
gem 'rmagick'

# Pry Debubber
gem 'pry'
gem 'pry-doc'

# Gravtastic
gem 'gravtastic'

# Fog for S3
gem 'fog'
gem 'unf'

# Stripe
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Default value for models
gem 'default_value_for', :git => 'git://github.com/tsmango/default_value_for.git'

group :production do
	gem 'rails_12factor'
	gem 'pg'
end

group :development, :test do
	# Quiet Assets
	gem 'quiet_assets'
	gem 'rspec-rails', '~> 3.0.0.beta'
	gem 'pry-doc'
  gem 'pry-debugger'
  gem 'factory_girl_rails'
  gem 'table_print'	
	gem 'sqlite3'
	gem 'capybara', '~> 2.2.0'
	gem 'poltergeist'
	gem 'guard-rspec', require: false
	gem 'rb-fsevent'
	gem 'guard-livereload'
	gem 'zeus', ">= 0.13.4.pre2"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

ruby '2.0.0'
# Use unicorn as the app server
# gem 'unicorn'
