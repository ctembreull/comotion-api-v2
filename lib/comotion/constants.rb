module Comotion
  class Constants
    class << self
      def UserRoles
        {
          researcher:           'Research Scientist',
          primary_investigator: 'Primary Investigator',
          innovator:            'Professor',
          partner:              'Partner',
          catalyst:             'Catalyst',
          staff:                'Staff Member',
          guru:                 'Guru',
        }
      end

      def UserGenders
        {
          male:   'Male',
          female: 'Female',
          custom: 'Custom',
        }
      end
    end
  end
end
