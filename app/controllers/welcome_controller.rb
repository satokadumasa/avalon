class WelcomeController < ApplicationController
  def index
    @notes = Note.all().where("notes.created_at > ? ",Time.current-7.day).order('id DESC').limit(APP_CONFIG["pagenate_count"]["notes"]).distinct
    @pages = Page.all().where("created_at > ? ",Time.current-7.day).limit(APP_CONFIG["pagenate_count"]["pages"])
  end
end
