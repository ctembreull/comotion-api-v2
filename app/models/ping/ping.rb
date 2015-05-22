module Comotion
  module Ping
    class Model < ActiveRecord::Base
      self.table_name = 'pings'
    end
  end
end
