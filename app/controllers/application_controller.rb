class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def record_not_found
    render json: { errors: [RECORD_NOT_FOUND_MESSAGE] }, status: 404
  end

  def parameter_missing(e)
    render json: { error: e.to_s }, status: 422
  end
end
