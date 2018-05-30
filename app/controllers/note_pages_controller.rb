class NotePagesController < ApplicationController
  before_action :set_note_page, only: [:show, :edit, :update, :destroy]

  # GET /note_pages
  # GET /note_pages.json
  def index
    @note_pages = NotePage.all
  end

  # GET /note_pages/1
  # GET /note_pages/1.json
  def show
  end

  # GET /note_pages/new
  def new
    @note_page = NotePage.new
  end

  # GET /note_pages/1/edit
  def edit
  end

  # POST /note_pages
  # POST /note_pages.json
  def create
    @note_page = NotePage.new(note_page_params)

    respond_to do |format|
      if @note_page.save
        format.html { redirect_to @note_page, notice: 'Note page was successfully created.' }
        format.json { render :show, status: :created, location: @note_page }
      else
        format.html { render :new }
        format.json { render json: @note_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_pages/1
  # PATCH/PUT /note_pages/1.json
  def update
    respond_to do |format|
      if @note_page.update(note_page_params)
        format.html { redirect_to @note_page, notice: 'Note page was successfully updated.' }
        format.json { render :show, status: :ok, location: @note_page }
      else
        format.html { render :edit }
        format.json { render json: @note_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_pages/1
  # DELETE /note_pages/1.json
  def destroy
    @note_page.destroy
    respond_to do |format|
      format.html { redirect_to note_pages_url, notice: 'Note page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_page
      @note_page = NotePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_page_params
      params.require(:note_page).permit(:note_id, :page_id)
    end
end
