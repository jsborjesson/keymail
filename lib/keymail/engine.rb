module Keymail
  class Engine < ::Rails::Engine
    isolate_namespace Keymail

    config.generators do |g|
      g.test_framework false
      g.assets         false
      g.helper         false
    end

  end

  def self.setup(&block)
    yield @config ||= Keymail::Engine::Configuration.new
  end

  # FIXME: this should be namespaced
  def self.config
    Rails.application.config
  end
end
