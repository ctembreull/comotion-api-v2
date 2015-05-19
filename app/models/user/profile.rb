module Comotion
  module User
    class Profile
      include Mongoid::Document
      include Mongoid::Timestamps

      USER_ROLES = {
        researcher:           'Research Scientist',
        primary_investigator: 'Primary Investigator',
        innovator:            'Professor',
        partner:              'Partner',
        catalyst:             'Catalyst',
        staff:                'Staff Member',
        guru:                 'Guru'
      }

      USER_GENDERS = {
        male:   'Male',
        female: 'Female',
        custom: 'Custom'
      }



      # CONFIGURATION
      store_in collection: 'co_user_profiles'

      # RELATIONS
      belongs_to :user, class_name: 'Comotion::User::Model'

      # General Fields
      field :first_name,   type: String
      field :last_name,    type: String
      field :title,        type: String
      field :organization, type: String
      field :headline,     type: String
      field :role,         type: String
      field :seeking,      type: String
      field :about,        type: String
      field :gender,       type: String
      field :street,       type: String
      field :city,         type: String
      field :country,      type: String
      field :state,        type: String
      field :birthday,     type: Date

      # Communication Fields
      field :phone_private, type: String
      field :phone_work,    type: String
      field :phone_mobile,  type: String
      field :fax,           type: String
      field :skype,         type: String
      field :msn,           type: String
      field :icq,           type: String
      field :xmpp,          type: String

      # Social Bookmark Fields
      field :url,           type: String
      field :linkedin,      type: String
      field :facebook,      type: String
      field :instagram,     type: String
      field :researchgate,  type: String
      field :Twitter,       type: String
      field :xing,          type: String
      field :youtube,       type: String
      field :vimeo,         type: String
      field :flickr,        type: String
      field :myspace,       type: String
      field :google_plus,   type: String

      # VALIDATIONS
      validates :role,    inclusion: { in: USER_ROLES }
      validates :seeking, inclusion: { in: USER_ROLES }
      validates :gender,  inclusion: { in: USER_GENDERS }


      def self.build(params)
        self.new(
          first_name: params[:first_name],
          last_name:  params[:last_name],
          title:      params[:title],
          position:   params[:position]
        )
      end

    end
  end
end
