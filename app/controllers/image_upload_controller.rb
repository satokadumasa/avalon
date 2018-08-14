class ImageUploadController < ApplicationController
  before_action :set_active

  def create
    # asset_params["user_id"] = current_user.id.to_s
    # logger.debug "ImageUploadController.create asset_params:" + asset_params.inspect
    asset = Asset.new(asset_params)
    asset.user_id = current_user.id.to_s
    logger.debug "ImageUploadController.create asset_params:" + asset.inspect

    unless [
      'image/png',
      'image/gif',
      'image/jpeg',
      'image/tiff',
    ].include?(asset.file.content_type)
      render json: { error: "file type (#{asset.file.content_type}) is not allowed" }, status: 500 and return
    end

    asset.save
    url = asset.url.gsub(@image_base_url, "")
    render json: { filename: url }
  end

  private
    def asset_params
      params.require(:asset).permit(:file, :user_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      # params.require(:note).permit(:title, :tag, :overview, :detail, user_notes_attributes: [:id,:user_id, :note_id], note_categories_attributes: [:id, :note_id,:category_id])
    end

    def set_active
      @active = {home: "#", notes: "active", categories: "#", top: "#", users: "#", tags: "#", user_profiles: "#"}
    end
end
