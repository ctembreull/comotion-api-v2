module Comotion
  module Entity
    class User < Grape::Entity
      format_with(:iso_timestamp) { |dt| dt.iso8601 }

      expose :email_address
      expose :fullname
      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
      expose :profile, using: Comotion::Entity::UserProfile, if: {type: :full}
    end
  end
end
