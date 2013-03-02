require 'rspec/core/rake_task'

spec_tasks = Dir['spec/*/'].map { |d| File.basename(d) }

spec_tasks.each do |folder|
  RSpec::Core::RakeTask.new("spec:#{folder}") do |t|
    t.pattern = "./spec/#{folder}/**/*_spec.rb"
    t.rspec_opts = %w(-fs --color)
  end
end

desc "Run complete application spec suite"
task 'spec' => spec_tasks.map { |f| "spec:#{f}" }
