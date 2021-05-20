class StillMigrateException < StandardError
  def response_status
    :unprocessable_entity
  end
  
  def message
    "still migrate"
  end
end