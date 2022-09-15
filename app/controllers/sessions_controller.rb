class SessionsController < ApplicationController

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
      if user.valid?
        session[:user_id] = user.id
        redirect_to dashboard_url
    else
      redirect_to root
    end
  end
end
