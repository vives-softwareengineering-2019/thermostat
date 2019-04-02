# require "bundler/gem_tasks"
require "rake/testtask"
require 'rubocop/rake_task'

desc "Run tests"
Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :all

desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new(:rubocop) do |task|

end

desc 'Run all tasks'
task :all do
  Rake::Task["test"].invoke
  Rake::Task["rubocop"].invoke
end