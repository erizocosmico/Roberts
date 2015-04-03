require 'rake'
require 'rake/testtask'
require './config/environment'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

require 'sequel'
Sequel.extension :migration
DB = Sequel.connect(ENV['ROBERTS_DATABASE_URL'])

# https://gist.github.com/kalmbach/4471560
namespace :db do
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

namespace :user do
  require 'bcrypt'
  users = DB[:users]

  desc 'Create a new administrator user'
  task :new_admin, :name, :email, :password do |t, args|
    if users[:email => args[:email]]
      puts 'There is already an user with that email!'
    else
      users.insert(:name => args[:name], :email => args[:email], :password => BCrypt::Password.create(args[:password]), :type => 1)
    end
  end

  desc 'Changes the password of an user'
  task :change_pass, :email, :password do |t, args|
    user = DB.from(:users).where(:email => args[:email])
    if user.count == 0
      puts 'There is no user with that email!'
    else
      user.update(:password => BCrypt::Password.create(args[:password]))
    end
  end

  desc 'Removes an user'
  task :remove, :email do |t, args|
    _DB.from(:users).where(:email => args[:email]).delete
  end
end

task default: :test
task spec: :test
