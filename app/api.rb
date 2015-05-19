module Comotion
  class API < Grape::API
    include Grape::ActiveRecord::Extension
    
    format :json

    mount ::Comotion::Ping::API
    mount ::Comotion::Users::API

  end # class API
end # module Comotion
