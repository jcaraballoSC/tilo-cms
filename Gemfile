source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Permite crear login de usuariCambios en formularioos
gem 'devise'
#Loader
gem 'nprogress-rails'
#Angular js
gem 'angularjs-rails'
#Subir archivos
#gem 'carrierwave'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
#Subir directamente a S3
gem 'carrierwave_direct'
#Integracion de Fog con AWS
gem "fog-aws"
#Postgresql
gem 'pg'
#Figaro
gem "figaro"
#para windows
gem 'tzinfo-data'
gem 'tzinfo'
gem 'execjs'


gem 'passenger'
group :production do
	#Gema para deploy en heroku - produccion
	gem 'rails_12factor', group: :production
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

end

