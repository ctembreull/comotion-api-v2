module Comotion
  module User
    class Profile
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'co_user_profiles'

      belongs_to :user,       class_name: 'Comotion::User::Model'

      field :first_name, type: String
      field :last_name,  type: String
      field :title,      type: String
      field :position,   type: String

    end
  end
end
