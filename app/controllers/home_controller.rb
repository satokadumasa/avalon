class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # @pages = Page.all().where(:created_by )
    @notes = Note.all().where("notes.created_at > ? ",Time.current-7.day).limit(APP_CONFIG["pagenate_count"]["notes"]).distinct
    @pages = Page.all().where("created_at > ? ",Time.current-7.day).limit(APP_CONFIG["pagenate_count"]["pages"])
  end
end
