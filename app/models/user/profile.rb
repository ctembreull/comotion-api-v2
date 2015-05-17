module Comotion
  module User
    class Profile
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'comotion_user_profile'

      belongs_to :user, class_name: 'Comotion::User::Model'

      field :first_name, type: String
      field :last_name,  type: String

    end
  end
end
