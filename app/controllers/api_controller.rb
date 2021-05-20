class ApiController < ActionController::API
  include HeaderConcern
  before_action :required_api_version!
  rescue_from StandardError, with: :render_error
  
  def ping
    render json: :ok
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