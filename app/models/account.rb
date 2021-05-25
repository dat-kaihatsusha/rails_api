class Account < ApplicationRecord
    has_secure_password
    has_many :access_grants,
             class_name: 'Doorkeeper::AccessGrant',
             foreign_key: :resource_owner_id,
             dependent: :delete_all # or :destroy if you need callbacks

    has_many :access_tokens,
             class_name: 'Doorkeeper::AccessToken',
             foreign_key: :resource_owner_id,
             dependent: :delete_all # or :destroy if you need callbacks

    class << self
        def authenticate params
            account = Account.find_by email: params[:email]
            return false unless account
            account.authenticate params[:password]
        end
    end
end
