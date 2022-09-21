# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :remove_junk

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
