# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_db_session',
  :secret      => 'b409bf92dbe3884fbb0392d6d0939d20aa89a5e285d1b3d8cbefbb17456dcbc52e54a479151043e64401e6cb7fd86c8ce85bd8ac70d61b62ba8337bcb8f74db0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
