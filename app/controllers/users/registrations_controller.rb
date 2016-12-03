class Users::RegistrationsController < Devise::RegistrationsController
    def build_resource(hash=nil)
        hash[:uid] = User.create_unique_string
        hash[:provider] = User.create_provider_string
        super
    end
end
