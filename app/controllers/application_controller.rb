class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: { errors: [RECORD_NOT_FOUND_MESSAGE] }, status: 404
  end
end
