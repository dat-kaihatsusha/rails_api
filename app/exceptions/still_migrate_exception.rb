class StillMigrateException < StandardError
  def response_status
    :unauthorized
  end
  
  def message
    "Not Anauthorized"
  end
end