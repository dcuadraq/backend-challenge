class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render nothing: true, status: :not_found
  end
end
