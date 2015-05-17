module Comotion
  module Team
    class Role
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'co_team_roles'

      belongs_to :team,   class_name: 'Comotion::Team::Model'
      belongs_to :member, class_name: 'Comotion::User::Model'

      

    end
  end
end
