class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookmarks = Bookmark.joins(:note).where("user_id=?", current_user.id).all
    @notes = Note.all().where("notes.created_at > ? ",Time.current-7.day).order('id DESC').limit(APP_CONFIG["pagenate_count"]["notes"]).distinct
    @pages = Page.all().where("created_at > ? ",Time.current-7.day).limit(APP_CONFIG["pagenate_count"]["pages"])
    @active = {home: "active", notes: "#", categories: "#", top: "#", users: "#", tags: "#", user_profiles: "#"}
    @prefs = YAML.load_file("#{Rails.root}/config/prefs.yml")
  end
end
