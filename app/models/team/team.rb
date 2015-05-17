module Comotion
  module Team
    class Model
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'co_teams'

      has_many :roles, class_name: 'Comotion::Team::Role'

      field :name, type: String

      def members
        roles.collect { |r| r.member }
      end

    end
  end
end
