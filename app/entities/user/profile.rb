module Comotion
  module Entity
    class UserProfile < Grape::Entity
      expose :first_name
      expose :last_name
      expose :title
      expose :organization
      expose :headline
      expose :role
      expose :seeking
      expose :about
      expose :gender
      expose :street
      expose :city
      expose :country
      expose :state
      expose :birthday
    end
  end
end
