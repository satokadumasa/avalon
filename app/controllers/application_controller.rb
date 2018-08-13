class ApplicationController < ActionController::Base
  require 'aws-sdk'
  before_action :set_description

  private
    def set_description
      logger.debug "ApplicationController.set_description image_base_url:" + APP_CONFIG.inspect
      @image_base_url = APP_CONFIG["image_base_url"]
      @description = APP_CONFIG["description"]
      @content_title = APP_CONFIG["content_title"]
      @content_overview = APP_CONFIG["content_overview"]
    end
end
