class Admin::ApplicationController < ApplicationController

  attr_accessor :current_admin, :access_token
  helper_method :current_admin

  before_action :set_access_token, :current_admin
  before_action :authenticate

  def current_admin
    return nil unless access_token
    @current_admin ||= Admin.find_by(token: access_token)
  end

  def response_error(object=nil, code=nil, data={})
    message = if object.blank?
                "Api Error."
              else
                if object.is_a?(String) || object.is_a?(Hash)
                  object
                else
                  object.errors.full_messages.join(",")
                end
              end
    return render json: {status: :fail, message: message, code: code}
  end

  def response_success(data={}, code=200)
    return render json: {status: :success, code: code, data: data}
  end

  protected

  def authenticate
    return response_error('当前用户不存在') unless @current_admin
  end

  def set_page
    @page = params[:page] || 1
    @per_page = params[:per_page] || Kaminari.config.default_per_page
  end

  private

  def set_access_token
    @access_token = request.env[Rack::OAuth2::Server::Resource::ACCESS_TOKEN]
  end

end
