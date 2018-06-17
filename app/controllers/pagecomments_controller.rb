class PagecommentsController < ApplicationController
  before_action :set_pagecomment, only: [:show, :edit, :update, :destroy]

  # GET /pagecomments
  # GET /pagecomments.json
  def index
    @pagecomments = Pagecomment.all
  end

  # GET /pagecomments/1
  # GET /pagecomments/1.json
  def show
  end

  # GET /pagecomments/new
  def new
    @pagecomment = Pagecomment.new
  end

  # GET /pagecomments/1/edit
  def edit
  end

  # POST /pagecomments
  # POST /pagecomments.json
  def create
    logger.debug "PagecommentsController::create pagecomment_params:" + pagecomment_params.inspect
    @pagecomment = Pagecomment.new(pagecomment_params)

    respond_to do |format|
      if @pagecomment.save
        logger.debug "PagecommentsController::create pagecomment:" + @pagecomment.inspect
        format.html { redirect_to url_for(controller: :pages, action: :show, note_id: @pagecomment.pagecomment_pages[0].page.notes[0].id, id: @pagecomment.pagecomment_pages[0].page.id)}
        
        # format.html { redirect_to @pagecomment, notice: 'Pagecomment was successfully created.' }
        # format.json { render :show, status: :created, location: @pagecomment }
      else
        format.html { render :new }
        # format.json { render json: @pagecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagecomments/1
  # PATCH/PUT /pagecomments/1.json
  def update
    respond_to do |format|
      if @pagecomment.update(pagecomment_params)
        format.html { redirect_to @pagecomment, notice: 'Pagecomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pagecomment }
      else
        format.html { render :edit }
        format.json { render json: @pagecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagecomments/1
  # DELETE /pagecomments/1.json
  def destroy
    @pagecomment.destroy
    respond_to do |format|
      format.html { redirect_to pagecomments_url, notice: 'Pagecomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagecomment
      @pagecomment = Pagecomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagecomment_params
      params.require(:pagecomment).permit(
        :title, 
        :detail, 
        pagecomment_pages_attributes: [:page_id, :pagecomment_id] ,
        user_pagecomments_attributes: [:user_id, :pagecomment_id]
      )
    end
end
