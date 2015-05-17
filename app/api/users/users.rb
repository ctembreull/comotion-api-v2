module Comotion
  module Users
    class API < Grape::API

      namespace :users do

        desc 'Create a user'
        post do
        end

        desc 'Get a list of users'
        get do
        end

        route_param :user_id do
          params do
            requires :user_id, type: String
          end

          desc 'Get a User object'
          get do
          end

          desc 'Update a user object'
          put do
          end

          desc 'Destroy a user object'
          delete do
          end

          namespace :profile do
            
            desc 'Get a user profile'
            get do
            end

            desc 'Update a user profile'
            put do
            end

          end # namespace :profile
        end # route_param :user_id
      end # namespace :users

    end # class Person
  end # module API
end # module Comotion
