class BookemarksController < ApplicationController
  before_action :set_bookemark, only: [:show, :edit, :update, :destroy]

  # GET /bookemarks
  # GET /bookemarks.json
  def index
    @bookemarks = Bookemark.all
  end

  # GET /bookemarks/1
  # GET /bookemarks/1.json
  def show
  end

  # GET /bookemarks/new
  def new
    @bookemark = Bookemark.new
  end

  # GET /bookemarks/1/edit
  def edit
  end

  # POST /bookemarks
  # POST /bookemarks.json
  def create
    @bookemark = Bookemark.new(bookemark_params)

    respond_to do |format|
      if @bookemark.save
        format.html { redirect_to @bookemark, notice: 'Bookemark was successfully created.' }
        format.json { render :show, status: :created, location: @bookemark }
      else
        format.html { render :new }
        format.json { render json: @bookemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookemarks/1
  # PATCH/PUT /bookemarks/1.json
  def update
    respond_to do |format|
      if @bookemark.update(bookemark_params)
        format.html { redirect_to @bookemark, notice: 'Bookemark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookemark }
      else
        format.html { render :edit }
        format.json { render json: @bookemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookemarks/1
  # DELETE /bookemarks/1.json
  def destroy
    @bookemark.destroy
    respond_to do |format|
      format.html { redirect_to bookemarks_url, notice: 'Bookemark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookemark
      @bookemark = Bookemark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookemark_params
      params.require(:bookemark).permit(:user_id, :note_id)
    end
end
