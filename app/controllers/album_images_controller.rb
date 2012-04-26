class AlbumImagesController < ApplicationController
  layout false
#  load_and_authorize_resource

  def destroy
    @album_image = AlbumImage.find(params[:id])
    @album_image.destroy
  end
end
