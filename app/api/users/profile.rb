module Comotion
  module Users
    class Profile < Grape::API

      namespace :users do
        route_param :user_id do
          params do
            requires :user_id, type: String
          end
          namespace :profile do

            get do
            end

            put do
            end


          end # namespace :profile
        end # route_param :user_id
      end # namespace :users
    end # class Profile
  end # module Users
end # module Comotion
