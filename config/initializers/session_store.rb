# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_points_session',
  :secret      => '547ed4a42316e9ae1f7e36a7eb87de18f813e971e5b85e0ff2ff3d2a5ab8ce6efc8df2563078ee7a76048b9b09378ae529fe5cbcc2b78660dcd7093e3836daae'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
