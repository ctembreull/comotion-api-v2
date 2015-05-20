module Comotion
  module Users
    class API < Grape::API

      namespace :users do

        desc 'Create a user'
        params do
          use :user_setup
        end
        post do
          user    = Comotion::User::Model.build(params)
          profile = Comotion::User::Profile.build(params)
          user.profile = profile

          user.save
          profile.save

          Comotion::Entity::User.represent(user, {type: :full})
        end

        desc 'Get a list of users'
        params do
          optional :page,  type: Integer, default: 1
          optional :limit, type: Integer, default: 25
        end
        get do
          c = Comotion::User::Model.paginate(page: params[:page], limit: params[:limit])
          Comotion::Entity::User.represent(c, {type: :limited})
        end

        route_param :user_id do
          params do
            requires :user_id, type: String
          end

          desc 'Get a User object'
          get do
            u = Comotion::User::Model.find_by(guid: params[:user_id])
            Comotion::Entity::User.represent(u, {type: :full})
          end

          desc 'Update a user object'
          params do
            optional :password,      type: String
            optional :email_address, type: String
          end
          put do
          end

          desc 'Destroy a user object'
          delete do
            Comotion::User::Model.find_by(guid: params[:user_id]).destroy

            # simple stub response
            { deleted: { user: true, profile: true } }
          end

        end # route_param :user_id
      end # namespace :users

    end # class Person
  end # module API
end # module Comotion
