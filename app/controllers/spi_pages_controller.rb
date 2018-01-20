# -*- coding: utf-8 -*-
class SpiPagesController < ApplicationController

  #ログデータの保存
  def create
    if logged_in? and User.where(id: session[:user_id]).present?
      user_id = session[:user_id]
    else
      user_id = 1
    end
    answer = params[:answer]
    question = params[:question]
    log = Log.new(user_id: user_id, answer: answer, question: question)
    log.save!
  end

  def index
  end

  def sonneki
  end

  def velocity
  end
end
