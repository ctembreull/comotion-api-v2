require 'bcrypt'

module Comotion
  module User
    class Model
      include Mongoid::Document
      include Mongoid::Timestamps
      include Mongoid::Pagination

      # CONFIGURATION
      store_in collection: 'co_users'

      # RELATIONS
      has_one :profile, class_name: 'Comotion::User::Profile', dependent: :destroy

      # FIELDS
      field :guid,            type: String
      field :email_address,   type: String
      field :fullname,        type: String
      field :password,        type: String
      field :password_salt,   type: String
      field :last_login_at,   type: DateTime
      field :last_login_from, type: String

      # INDEXES
      index({ guid: 1})
      index({ email_address: 1}, {unique: true, name: 'email_index'})

      # VALIDATIONS
      validates :email_address, presence: true, uniqueness: true
      validates :password,      presence: true, length: {minimum: 8}
      validates :guid,          presence: true, uniqueness: true
      validates :password_salt, presence: true

      # INSTANCE METHODS
      def password_match?(password_candidate)
        return (self.class.hash_password(password_salt + password_candidate) === password)
      end


      # ENTITIES

      # CLASS METHODS
      class << self
        def build(params)
          password_salt   = self.generate_password_salt
          hashed_password = self.hash_password(password_salt + params[:password])
          self.new(
            guid:          SecureRandom.uuid,
            email_address: params[:email_address],
            fullname:      params[:first_name] + ' ' + params[:last_name],
            password_salt: password_salt,
            password:      hashed_password
          )
        end

        def generate_password_salt
          SecureRandom.hex(4)
        end

        def hash_password(password)
          BCrypt::Password.create(password)
        end

      end # class << self
    end # class Model
  end # module User
end # module Comotion
