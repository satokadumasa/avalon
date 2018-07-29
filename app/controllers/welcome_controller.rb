class WelcomeController < ApplicationController
  before_action :set_active

  def index
    @notes = Note.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order('id DESC')
    if params[:tag].present?
      @notes = @notes.where("notes.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @notes = @notes.all
    @pages = Page.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["pages"])
    if params[:tag].present?
      @pages = @pages.where("pages.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @pages = @pages.all
    @active = {home: "#", notes: "#", pages: "#", top: "active"}
    # @notes = Note.all().order('id DESC').limit(APP_CONFIG["pagenate_count"]["notes"]).distinct
    # @pages = Page.all().limit(APP_CONFIG["pagenate_count"]["pages"])
  end

  private
    def set_active
      @active = {home: "#", notes: "#", categories: "#", top: "active"}
    end
end
