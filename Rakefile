require "rubygems"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

task :default => ["test"]

desc 'Build the CSS gem'
task :gem do
  exec 'gem build css.gemspec && mkdir -p pkg && mv ./css-*.gem pkg'
end
