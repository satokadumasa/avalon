class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["pages"]).all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    logger.debug "PagesController::show() params:" + params.inspect
    @page = Page.find(params[:id])
    @pagecomment =  @page.pagecomments.build
    @pagecomment.pagecomment_pages.build
    @pagecomment.user_pagecomments.build
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
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    ActiveRecord::Base.transaction do
      @page = Page.new(page_params)
      logger.debug "PagesController::create() page:" + @page.inspect
      @page.save!
    end
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
    ActiveRecord::Base.transaction do
      @page.update(page_params)
    end
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
    ActiveRecord::Base.transaction do
      @page.destroy
    end
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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :overview, :detail, user_pages_attributes: [:user_id], note_pages_attributes: [:note_id])
    end
end
