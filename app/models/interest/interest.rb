module Comotion
  module Interest
    class Model
      include Mongoid::Document

      store_in collection: 'co_interests'

      belongs_to :interestable, polymorphic: true

      field :name, type: String

    end
  end
end
