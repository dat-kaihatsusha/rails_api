class Api::GenerateTokenService
    attr_reader :account

    def initialize account
        @account = account
    end

    def call
        generate_token account
    end

    private
    def generate_token account
        access_token = Doorkeeper::AccessToken.create! resource_owner_id: account.id, expires_in: Doorkeeper.configuration.access_token_expires_in.to_i, use_refresh_token: true
        token_info = Doorkeeper::OAuth::TokenResponse.new(access_token).body.merge uid: account.id, email: account.email
        created_at = token_info["created_at"]
        token_info["created_at"] = Time.zone.at(created_at).iso8601
        token_info.merge expires_on: Time.zone.at(created_at + token_info["expires_in"]).iso8601
    end
end