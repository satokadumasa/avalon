class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_active

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["pages"])
    if params[:tag].present?
      @pages = @pages.where("pages.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @pages.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @title = @page.title
    @tags = @page.tag || [""]
    logger.debug "PagesController::show() params:" + params.inspect
    @page = Page.find(params[:id])
    @pagecomment =  @page.pagecomments.build
    @pagecomment.pagecomment_pages.build
    @pagecomment.user_pagecomments.build
    @pages = Page.joins(:notes).where("notes.id = #{@page.notes[0].id}").paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order("pages.id").all
    if current_user
      @pagecomment.pagecomment_pages[0].page_id = @page.id
      @pagecomment.user_pagecomments[0].user_id = current_user.id
    end
  end

  # GET /pages/new
  def new
    logger.debug "PagesController::new() params:" + params.inspect
    @page = Page.new
    @page.note_pages.build
    @page.user_pages.build
    @page.note_pages[0].note_id = params[:note_id]
    @page.user_pages[0].user_id = current_user.id
    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
  end

  # GET /pages/1/edit
  def edit
    raise "あなたのページではありません。"  unless @page.user_pages[0].user_id == current_user.id
  end

  # POST /pages
  # POST /pages.json
  def create
    page_attr = page_params
    page_attr[:tag] = page_params[:tag].split(" ")
    ActiveRecord::Base.transaction do
      Tag.add_count(tag_names, [])
      @page = Page.new(page_attr)
      logger.debug "PagesController::create() page:" + @page.inspect
      @page.save!
    end

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

    respond_to do |format|
      format.html { redirect_to :action => "show",:id => @page.id}
      # format.json { render :show, status: :created, location: @page }
    end
    rescue => e
    respond_to do |format|
      format.html { render :new }
      # format.json { render json: @page.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    raise "あなたのページではありません。"  unless @page.user_pages[0].user_id == current_user.id
    page_attr = page_params
    page_attr[:tag] = page_params[:tag].split(" ")
    ActiveRecord::Base.transaction do
     Tag.add_count(tag_names, @page.tag)
     @page.update(page_attr)
    end

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

    respond_to do |format|
      format.html { redirect_to :action => "show",:id => @page.id}
      format.json { render :show, status: :ok, location: @page }
    end
    rescue => e
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @page.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    raise "あなたのページではありません。"  unless @page.user_pages[0].user_id == current_user.id
    ActiveRecord::Base.transaction do
      @page.destroy
    end

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue => e
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page could not be deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
      @description = @page.overview
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :tags, :overview, :detail, user_pages_attributes: [:id, :user_id, :page_id], note_pages_attributes: [:id, :note_id, :page_id])
    end

    def set_active
      @active = {home: "#", notes: "#", categories: "active", top: "#", users: "#", tags: "#", user_profiles: "#"}
    end
end
