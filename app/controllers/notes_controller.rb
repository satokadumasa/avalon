class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order('id DESC')
    if params[:tag].present?
      @notes = @notes.where("notes.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @notes.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @title = @note.title
    @tags = @note.tag
    @pages = Page.joins(:notes).where("notes.id = #{params[:id]}").paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order("pages.id").all
    if current_user
      @bookmarked = Bookmark.where(:user_id => current_user.id)
      @bookmark = Bookmark.new
      @bookmark.note_id = @note.id
      @bookmark.user_id = current_user.id
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.user_notes.build
    @note.note_categories.build
    @note.user_notes[0].user_id = current_user.id
  end

  # GET /notes/1/edit
  def edit
    raise "あなたのノートではありません。"  unless @note.user_notes[0].user_id == current_user.id
  end

  # POST /notes
  # POST /notes.json
  def create
    note_attr = note_params
    note_attr[:tag] = note_params[:tag].split(" ")
    ActiveRecord::Base.transaction do
      @note = Note.new(note_attr)
      raise "ノートの作成ができませんでした。" unless @note.save!
    end
    respond_to do |format|
      format.html { redirect_to @note, notice: 'Note was successfully created.' }
      format.json { render :show, status: :created, location: @note }
    end
    rescue => e
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @note.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    raise "あなたのノートではありません。"  unless @note.user_notes[0].user_id == current_user.id
    note_attr = note_params
    note_attr[:tag] = note_params[:tag].split(" ")
    ActiveRecord::Base.transaction do
      # raise "ノートの更新ができませんでした。" unless @note.update(note_params)
      raise "ノートの更新ができませんでした。" unless @note.update_attributes(note_attr)
    end
    respond_to do |format|
      format.html { redirect_to @note, notice: 'Note was successfully updated.' }
      format.json { render :show, status: :ok, location: @note }
    end
    rescue => e
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @note.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    raise "あなたのノートではありません。"  unless @note.user_notes[0].user_id == current_user.id
    ActiveRecord::Base.transaction do
      @note.destroy
    end
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue => e
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note could not be deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :tag, :overview, :detail, user_notes_attributes: [:id,:user_id, :note_id], note_categories_attributes: [:id, :note_id,:category_id])
    end
end
