# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_emprestimo_espacos_session',
  :secret      => '39696e755c4fdc1d02eff406b4c1612fc243de6c0f549dead92d13152092ee1b4c454777c2931b42f024b98bf94de8c560019babe3f92716a35a9bfbf6356325'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
