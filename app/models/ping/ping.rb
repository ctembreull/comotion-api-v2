module Comotion
  module Ping
    class Model
      include Mongoid::Document

      field :name, type: String

    end
  end
end
