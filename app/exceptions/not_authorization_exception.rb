class NotAuthorizationException < StandardError
  def response_status
    :unauthorized
  end

  def message
    "Not authorization"
  end
end