require 'rubygems'
require 'bundler'
require 'active_record'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
include ActiveRecord::Tasks

db_dir     = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)

DatabaseTasks.env    = ENV['RACK_ENV'] || :development
DatabaseTasks.db_dir = db_dir
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(config_dir, 'database.yml')))
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)

  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env
end

task :routes => :environment do
  Comotion::API.routes.each do |api|
    method = api.route_method.ljust(10)
    path   = api.route_path
    puts "     #{method} #{path}"
  end
end

load 'active_record/railties/databases.rake'


#namespace :db do
#  task :clean => :environment do
#    DatabaseCleaner.clean
#  end
#end

task default: [:routes]
