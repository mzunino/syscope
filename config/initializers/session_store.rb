# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_depot2_session',
  :secret      => '5ea28750850d942117364a86f9c862d3a53b0fb4c3aee73309e36c3dc8ec5f5bb5fc6b8b5ac666eed57ff59dc1dce18f1ec3cf92f3b0426c860c332c8cdd8199'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
