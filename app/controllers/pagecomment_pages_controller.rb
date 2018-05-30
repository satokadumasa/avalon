class PagecommentPagesController < ApplicationController
  before_action :set_pagecomment_page, only: [:show, :edit, :update, :destroy]

  # GET /pagecomment_pages
  # GET /pagecomment_pages.json
  def index
    @pagecomment_pages = PagecommentPage.all
  end

  # GET /pagecomment_pages/1
  # GET /pagecomment_pages/1.json
  def show
  end

  # GET /pagecomment_pages/new
  def new
    @pagecomment_page = PagecommentPage.new
  end

  # GET /pagecomment_pages/1/edit
  def edit
  end

  # POST /pagecomment_pages
  # POST /pagecomment_pages.json
  def create
    @pagecomment_page = PagecommentPage.new(pagecomment_page_params)

    respond_to do |format|
      if @pagecomment_page.save
        format.html { redirect_to @pagecomment_page, notice: 'Pagecomment page was successfully created.' }
        format.json { render :show, status: :created, location: @pagecomment_page }
      else
        format.html { render :new }
        format.json { render json: @pagecomment_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagecomment_pages/1
  # PATCH/PUT /pagecomment_pages/1.json
  def update
    respond_to do |format|
      if @pagecomment_page.update(pagecomment_page_params)
        format.html { redirect_to @pagecomment_page, notice: 'Pagecomment page was successfully updated.' }
        format.json { render :show, status: :ok, location: @pagecomment_page }
      else
        format.html { render :edit }
        format.json { render json: @pagecomment_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagecomment_pages/1
  # DELETE /pagecomment_pages/1.json
  def destroy
    @pagecomment_page.destroy
    respond_to do |format|
      format.html { redirect_to pagecomment_pages_url, notice: 'Pagecomment page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagecomment_page
      @pagecomment_page = PagecommentPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagecomment_page_params
      params.require(:pagecomment_page).permit(:pagecomment_id, :page_id)
    end
end
