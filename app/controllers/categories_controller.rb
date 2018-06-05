class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    ActiveRecord::Base.transaction do
      #例外が発生する可能性のある処理
      @category = Category.new(category_params)
      raise "カテゴリーの作成ができませんでした。" unless @category.save!
    end
      #正常に動作した場合の処理
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      end
    rescue => e
    #例外が発生した場合の処理
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    ActiveRecord::Base.transaction do
      @category.update(category_params)
    end
    respond_to do |format|
      format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      format.json { render :show, status: :ok, location: @category }
    end
    rescue => e
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    ActiveRecord::Base.transaction do
      @category.destroy
    end
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue => e
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category could not be deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
