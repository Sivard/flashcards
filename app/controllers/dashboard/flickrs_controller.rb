class Dashboard::FlickrsController < ApplicationController
  def index
    text = params[:text]
    flickr = Flickr.new(text).get_list
    impressionist(Card.find(params[:card_id]), "get list from flickr api")

    render json: flickr.to_json
  end
end
