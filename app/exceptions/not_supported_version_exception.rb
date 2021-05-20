class NotSupportedVersionException < StandardError
  def response_status
    :bad_request
  end
  
  def message
    "Not supported version"
  end
end