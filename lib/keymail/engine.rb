module Keymail
  class Engine < ::Rails::Engine
    isolate_namespace Keymail

    config.generators do |g|
      g.test_framework false
      g.assets         false
      g.helper         false
    end
  end
end
