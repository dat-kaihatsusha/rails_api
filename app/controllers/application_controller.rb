class ApplicationController < ActionController::Base
  def health_check
     ActiveRecord::Migration[6.1].check_pending!
     render json: :ok
  rescue
    raise StillMigrateException
  end
end
