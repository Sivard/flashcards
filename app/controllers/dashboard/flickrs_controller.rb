class Dashboard::FlickrsController < ApplicationController
  impressionist

  def index
    text = params[:text]
    flickr = Flickr.new(text).get_list

    render json: flickr.to_json
  end
end
