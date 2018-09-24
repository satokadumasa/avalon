class WelcomeController < ApplicationController
  before_action :set_active

  def index
    logger.debug "WelcomeController.index Class:" + controller_name
    @notes = Note.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order('id DESC')
    if params[:tag].present?
      @notes = @notes.where("notes.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @notes = @notes.all
    
    @pages = Page.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["pages"]).order('id DESC')
    if params[:tag].present?
      @pages = @pages.where("pages.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @pages = @pages.all
    
    @tags = Tag.order("cnt DESC").limit(APP_CONFIG["pagenate_count"]["pages"])
    
    @active = {home: "#", notes: "#", pages: "#", top: "active"}
  end

  private
    def set_active
      @active = {home: "#", notes: "#", categories: "#", top: "active", users: "#", tags: "#", user_profiles: "#"}
    end
end
