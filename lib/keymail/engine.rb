module Keymail
  class Engine < ::Rails::Engine
    isolate_namespace Keymail

    config.generators do |g|
      g.test_framework nil
    end
  end
end
