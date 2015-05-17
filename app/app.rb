module Comotion
  class App
    def initialize; end

    def self.instance
      @instance ||= Rack::Builder.new(debug: true) do
        run Comotion::App.new
      end.to_app
    end

    def call(env)
      Comotion::API.call(env)
    end
  end
end
