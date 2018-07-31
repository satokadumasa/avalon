class ApplicationController < ActionController::Base
  require 'aws-sdk'
  before_action :set_description

  private
    def set_description
      @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
      @content_title="書庫セラエノ"
      @content_overview="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
    end
end
