class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :authenticate, only: :sign_in

  def sign_in
    admin = Admin.find_by(mobile: params[:mobile])
    if admin && admin.authenticate(params[:password])
      data = {token: admin.token}
      response_success(data)
    else
      response_error('用户名或者密码不正确')
    end
  end

  def sign_out
    current_admin.regenerate_token
    response_success
  end

end
