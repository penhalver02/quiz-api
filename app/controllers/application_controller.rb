# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound do |e|
    render json: { errors: e.message }, code: :bad_request
  end
end
