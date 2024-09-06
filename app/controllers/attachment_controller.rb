class AttachmentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
    Rails.logger.debug("Params: #{params.inspect}")
    Rails.logger.debug("Files: #{params[:file].inspect}")

    if params[:file].present?
      blob = ActiveStorage::Blob.create_and_upload!(
        io: params[:file].tempfile,
        filename: params[:file].original_filename,
        content_type: params[:file].content_type,
      )
      render json: { id: blob.signed_id }
    else
      render json: { error: "No file received" }, status: :unprocessable_entity
    end
  end

  def destroy
    blob = ActiveStorage::Blob.find_signed(params[:id])
    blob.purge
    head :no_content
  end
end
