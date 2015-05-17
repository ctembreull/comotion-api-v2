module Comotion
  module Ping
    class API < Grape::API

      namespace :ping do

        get do
          {ping: 'pong'}
        end

      end

    end
  end
end
