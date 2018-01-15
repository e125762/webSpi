# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    reset_session
    session[:user_id] = user.id
    session[:nickname] = user.nickname
    
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def failure
    redirect_to root_path, alert: "Twitter認証に失敗しました"
  end
end
