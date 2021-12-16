class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response

  private

  def render_not_found_response(errors)
    render json: errors.message, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { error: invalid.record.error.full_messages }
  end
end
