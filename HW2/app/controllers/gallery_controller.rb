class GalleryController < ApplicationController
  def index
    @images = ["https://beta.infinum.co/assets/careers/teambuilding@2x-c6a33a0df1039569baf6c558d1b40ed6.jpg",
    "https://beta.infinum.co/assets/careers/party@2x-d5d122ea91e0c0e90895031bd65a2d11.jpg",
    "https://beta.infinum.co/assets/careers/health@2x-2aeb28d334de311987d0095de04ab7a2.jpg"]
  end
  def show
    @images = ["https://beta.infinum.co/assets/careers/teambuilding@2x-c6a33a0df1039569baf6c558d1b40ed6.jpg",
    "https://beta.infinum.co/assets/careers/party@2x-d5d122ea91e0c0e90895031bd65a2d11.jpg",
    "https://beta.infinum.co/assets/careers/health@2x-2aeb28d334de311987d0095de04ab7a2.jpg"]

    @param_id=params[:image_number]
  end
end
