class RestaurantsController < ApplicationController
  

def index

end
end


def index
  @photos = Photo.all
  set_photo
end

def set_photo
  @photo = Photo.find(params[:id])
end
