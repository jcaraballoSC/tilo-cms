# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#Se agrega la hoja de estilos especifica para el login de Tilo
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( custom.css )
Rails.application.config.assets.precompile += %w( nprogress.css )
Rails.application.config.assets.precompile += %w( bootstrap-glyphicons.css )
Rails.application.config.assets.precompile += %w( menu_side.css )
