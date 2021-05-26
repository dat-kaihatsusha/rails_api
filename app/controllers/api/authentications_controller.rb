class Api::AuthenticationsController < ApiController
  skip_before_action :required_api_authorization!, only: :token
  # PUT /api/token
  def token
    account = Account.authenticate api_authentication_params
    if account
      data_token = Api::GenerateTokenService.new(account).call
      render json: {data: data_token}, status: :ok
    else
      render json: {errors: "error get token failed"}, status: 400
    end
  end

  def revoke_token
    revoke_token_service = Api::RevokeTokenService.new doorkeeper_token.token
    revoke_token_service.execute
    if revoke_token_service.success?
      render json: :ok, status: 200
    else
      render json: {errors: revoke_token_service.errors}, status: 400
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def api_authentication_params
      params.require(:account).permit(:email, :password)
    end
end
