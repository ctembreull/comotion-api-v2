module Comotion
  module Users
    class API < Grape::API
      helpers Comotion::Helpers::UserHelpers

      namespace :users do
        route_param :user_id do
          params do
            requires :user_id, type: String
          end
          namespace :profile do

            get do
              u = Comotion::User::Model.find_by(guid: params[:user_id])
              Comotion::Entity::User.represent(u, {type: :full})
            end

            desc 'Update a user profile'
            params do
              use :profile_fields
            end
            put do
              user    = Comotion::User::Model.find_by(guid: params[:user_id])
              profile = user.profile
              params[:profile].each { |k,v| profile[k] = v}
              profile.save!

              Comotion::Entity::User.represent(user, {type: :full})
            end


          end # namespace :profile
        end # route_param :user_id
      end # namespace :users
    end # class Profile
  end # module Users
end # module Comotion
