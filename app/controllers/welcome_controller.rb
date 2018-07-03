class WelcomeController < ApplicationController
  def index
    @notes = Note.all().order('id DESC').limit(APP_CONFIG["pagenate_count"]["notes"]).distinct
    @pages = Page.all().limit(APP_CONFIG["pagenate_count"]["pages"])
  end
end
