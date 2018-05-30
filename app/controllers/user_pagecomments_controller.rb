class UserPagecommentsController < ApplicationController
  before_action :set_user_pagecomment, only: [:show, :edit, :update, :destroy]

  # GET /user_pagecomments
  # GET /user_pagecomments.json
  def index
    @user_pagecomments = UserPagecomment.all
  end

  # GET /user_pagecomments/1
  # GET /user_pagecomments/1.json
  def show
  end

  # GET /user_pagecomments/new
  def new
    @user_pagecomment = UserPagecomment.new
  end

  # GET /user_pagecomments/1/edit
  def edit
  end

  # POST /user_pagecomments
  # POST /user_pagecomments.json
  def create
    @user_pagecomment = UserPagecomment.new(user_pagecomment_params)

    respond_to do |format|
      if @user_pagecomment.save
        format.html { redirect_to @user_pagecomment, notice: 'User pagecomment was successfully created.' }
        format.json { render :show, status: :created, location: @user_pagecomment }
      else
        format.html { render :new }
        format.json { render json: @user_pagecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_pagecomments/1
  # PATCH/PUT /user_pagecomments/1.json
  def update
    respond_to do |format|
      if @user_pagecomment.update(user_pagecomment_params)
        format.html { redirect_to @user_pagecomment, notice: 'User pagecomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_pagecomment }
      else
        format.html { render :edit }
        format.json { render json: @user_pagecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_pagecomments/1
  # DELETE /user_pagecomments/1.json
  def destroy
    @user_pagecomment.destroy
    respond_to do |format|
      format.html { redirect_to user_pagecomments_url, notice: 'User pagecomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pagecomment
      @user_pagecomment = UserPagecomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_pagecomment_params
      params.require(:user_pagecomment).permit(:user_id, :pagecomment_id)
    end
end
