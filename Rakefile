require 'rake'
require 'rake/testtask'
require './config/environment'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

# https://gist.github.com/kalmbach/4471560
namespace :db do
  require 'sequel'
  Sequel.extension :migration
  DB = Sequel.connect(ENV['ROBERTS_DATABASE_URL'])

  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_info)
                DB[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc 'Perform migration up to latest migration available'
  task :migrate do
    Sequel::Migrator.run(DB, 'migrations')
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target or full rollback as default'
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, 'migrations', :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc 'Perform migration reset (full rollback and migration)'
  task :reset do
    Sequel::Migrator.run(DB, 'migrations', :target => 0)
    Sequel::Migrator.run(DB, 'migrations')
    Rake::Task['db:version'].execute
  end

  task :erase do
    FileUtils.rm ENV['ROBERTS_DATABASE_URL'].sub 'sqlite:/', '.'
  end
end

task default: :test
task spec: :test
