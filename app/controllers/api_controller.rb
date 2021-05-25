class ApiController < ActionController::API
  include HeaderConcern
  before_action :required_api_version!
  before_action :required_api_authorization!
  before_action :current_account
  skip_before_action :required_api_authorization!, only: :ping
  rescue_from StandardError, with: :render_error
  
  def ping
    render json: :ok
  end

  def current_account
    @current_account ||= Account.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
  
  # Apiでエラーになった場合はここを通って、エラーコードとかをかえす。
  def render_error(error)
    # 独自エラーにはstatusを持たせて制御
    if error.respond_to?(:response_status)
      status = error.response_status
    else
      # saveによるエラーは unprocessable_entity のほうが好ましいと思った
      status = :unprocessable_entity
    end
    render json: error.message, status: status
  end
end