begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load "rails/tasks/engine.rake"

Bundler::GemHelper.install_tasks

require "rake/testtask"
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end

require "rubocop/rake_task"
RuboCop::RakeTask.new(:style) do |t|
  t.options = ["--display-cop-names"]
end

task default: :test

### Custom development tasks

namespace :dev do
  desc "Opens the Coverage statistics"
  task :coverage do
    if File.exist?("coverage/index.html")
      `open coverage/index.html`
    else
      puts "No coverage info generated, run `rake test` first!"
    end
  end

  desc "Publish the documentation to Github pages"
  task :publish_docs do
    sh "mkdocs build"
    sh "ghp-import -p site"
  end
end
