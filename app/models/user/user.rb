module Comotion
  module User
    class Model
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'comotion_user'

      has_one :profile, class_name: 'Comotion::User::Profile'

      field :email_address,   type: String
      field :fullname,        type: String
      field :password,        type: String
      field :last_login_at,   type: DateTime
      field :last_login_from, type: String

    end
  end
end
