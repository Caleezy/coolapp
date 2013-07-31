# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
CoolApp::Application.config.secret_key_base = '23da7e965dcd7fc8a3088971c48185db07d049d45b4dced60d3dbea005809073456a592168dcdd518e1d2eacee4a11349444f0ab71d936b8faae6cdb18e11e74'
require 'securerandom'
def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

CoolApp::Application.config.secret_key_base = secure_token