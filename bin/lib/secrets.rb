require 'securerandom'

module Secrets
  def self.Generate
    return if File.exist?('config/secrets.yml')

    dev_secret = SecureRandom.hex(64)
    prod_secret = SecureRandom.hex(64)

    secret = File.open("config/secrets.yml.sample").read
    secret.gsub!("!secret!", dev_secret).gsub!("!test-secret!", prod_secret)

    file = File.open("config/secrets.yml", "w")
    file.write(secret)
    file.close
  end
end
