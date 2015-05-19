module Comotion
  module Users
    class API < Grape::API

      helpers do
        params :create_user do
          # user object items
          requires :email_address, type: String, allow_blank: false
          requires :password,      type: String, allow_blank: false
          # profile object items
          requires :first_name,    type: String, allow_blank: false
          requires :last_name,     type: String, allow_blank: false
          requires :title,         type: String, allow_blank: false
          requires :organization,  type: String, allow_blank: false
        end
      end



      namespace :users do

        desc 'Create a user'
        params do
          use :create_user
        end
        post do
          u = Comotion::User::Model.build(params)
          p = Comotion::User::Profile.build(params)
          u.profile = p
          u.save
          p.save
        end

        desc 'Get a list of users'
        params do
          optional :page,  type: Integer, default: 1
          optional :limit, type: Integer, default: 25
        end
        get do
          Comotion::User::Model.paginate(page: params[:page], limit: params[:limit])
        end

        route_param :user_id do
          params do
            requires :user_id, type: String
          end

          desc 'Get a User object'
          get do
            Comotion::User::Model.find_by(guid: params[:user_id])
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
