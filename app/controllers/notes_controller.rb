class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_active

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order('id DESC')
    if params[:tag].present?
      @notes = @notes.where("notes.tag LIKE ? ", "%#{params[:tag]}%") 
    end
    @notes.all
    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
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
    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
  end

  # GET /notes/1/edit
  def edit
    raise "あなたのノートではありません。"  unless @note.user_notes[0].user_id == current_user.id
    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"
  end

  # POST /notes
  # POST /notes.json
  def create
    note_attr = note_params
    tag_names = note_params[:tag].split(" ")
    note_attr[:tag] = tag_names

    Tag.add_count(tag_names)
    ActiveRecord::Base.transaction do
      Tag.add_count(tag_names, [])
      @note = Note.new(note_attr)
      raise "ノートの作成ができませんでした。" unless @note.save!
    end

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

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
    tag_names = note_params[:tag].split(" ")
    note_attr[:tag] = tag_names

    ActiveRecord::Base.transaction do
      Tag.add_count(tag_names, @note.tag)
      raise "ノートの更新ができませんでした。" unless @note.update_attributes(note_attr)
    end

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

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

    @description="小説投稿サイト「書庫セラエノ」。絶賛会員募集長！"

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
      @description = @note.overview
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :tag, :overview, :detail, user_notes_attributes: [:id,:user_id, :note_id], note_categories_attributes: [:id, :note_id,:category_id])
    end

    def set_active
      @active = {home: "#", notes: "active", categories: "#", top: "#", users: "#", tags: "#", user_profiles: "#"}
    end
end
