module Keymail
  class Engine < ::Rails::Engine
    isolate_namespace Keymail

    config.generators do |g|
      g.test_framework false
      g.assets         false
      g.helper         false
    end
  end

  def self.setup
    yield @config ||= Keymail::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    attr_accessor :from_email,
                  :expiration_time

    def initialize
      # Set defaults here
      self.expiration_time = 10.minutes
    end
  end
end
