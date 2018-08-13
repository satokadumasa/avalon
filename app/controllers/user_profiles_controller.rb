class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_active

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    # @user_profiles = UserProfile.all
    @user_profiles = UserProfile.paginate(:page => params[:page], per_page: APP_CONFIG["pagenate_count"]["notes"]).order("user_profiles.id").all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    resource = Aws::S3::Resource.new(
      :region => 'us-east-1', # 東京以外のリージョンの場合は適宜変更してください
      :access_key_id => 'ENV["AWS_ACCESS_KEY_ID"]',
      :secret_access_key => 'ENV["AWS_SECRET_ACCESS_KEY"]'
    )
    arr = @user_profile.profile_photo.to_s.split("celaenoimages/")
    object = resource.bucket('celaenoimages').object(arr[1])
    url = URI.parse(object.presigned_url(:get, expires_in: 60)) # 有効期限を1分から変更する場合は適宜変更してください。
    @profile_photo = url
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
    @user_profile.user_id = current_user.id
    @prefs = YAML.load_file("config/prefs.yml")
  end

  # GET /user_profiles/1/edit
  def edit
    raise "あなたのプロフィールではありません。" unless @user_profile.user_id == current_user.id
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    raise "あなたのプロフィールではありません。" unless @user_profile.user_id == current_user.id
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    raise "あなたのプロフィールではありません。" unless @user_profile.user_id == current_user.id
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
      @prefs = YAML.load_file("config/prefs.yml")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:user_id, :first_name, :last_name, :profile_photo, :pref_code, :postal_code, :address, :self_introduction)
    end

    def set_active
      @active = {home: "#", notes: "#", categories: "#", top: "#", users: "#", tags: "#", user_profiles: "active"}
    end
end
