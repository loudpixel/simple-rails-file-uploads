# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nginxuploadtest_session',
  :secret      => '687f29512ba7957846ef57a6420f65f87179f2aedfdb5a586af425c1fbd3781c2c4efd1611232230f2abc0bb5d6bcfacf8627f63ff21f3df9669eb3ade212aa0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
