# frozen_string_literal: true

class SessionsController < ApplicationController
  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid? # video added check for authorization token here instead
      session[:user_id] = user.id # video set session equal to authorization token from google (did not reference any object)
      redirect_to dashboard_url
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
