$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "keymail/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "keymail"
  s.version     = Keymail::VERSION
  s.authors     = ["alcesleo"]
  s.email       = ["lagginglion@gmail.com"]
  s.homepage    = "https://github.com/alcesleo/keymail"
  s.summary     = "Forget passwords, authenticate via email!"
  s.description = "Instead of using passwords, keymail sends emails with a link that logs in your user automatically."

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"

end
