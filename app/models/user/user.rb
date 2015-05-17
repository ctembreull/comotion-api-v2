module Comotion
  module User
    class Model
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'co_users'

      has_one  :profile,    class_name: 'Comotion::User::Profile'
      has_many :interests,  class_name: 'Comotion::Interest::Model', as: :interestable
      has_many :team_roles, class_name: 'Comotion::Team::Role'

      field :email_address,   type: String
      field :fullname,        type: String
      field :password,        type: String
      field :last_login_at,   type: DateTime
      field :last_login_from, type: String

    end
  end
end
