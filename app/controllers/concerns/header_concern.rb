module HeaderConcern
  extend ActiveSupport::Concern
  SUPPORTED_VERSIONS = {
    "v1" => true
  }
  
  # Header内にX-Api-Versionを必須にする
  def required_api_version!
    if request.headers["X-Api-Version"].nil? || !HeaderConcern::SUPPORTED_VERSIONS.has_key?(request.headers["X-Api-Version"])
      raise NotSupportedVersionException 
    end
  end
end
