class ApplicationController < ActionController::API
  before_action :force_response_format

  protected

  def force_response_format
    request.format = :json
  end
end
