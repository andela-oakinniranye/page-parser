class ApplicationController < ActionController::API
  include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  def resource_not_found
    not_found_message = "The resource you tried to access was not found"
    render json: not_found_message, status: 404, serializer: ErrorSerializer
  end
end
