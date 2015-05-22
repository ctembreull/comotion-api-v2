require 'pathname'

ROOT = Pathname.new(File.expand_path('../../..', __FILE__))
Grape::ActiveRecord.database_file = ROOT.join('config', 'database.yml')
