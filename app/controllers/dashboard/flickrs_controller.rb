class Dashboard::FlickrsController < ApplicationController
  def index
    text = params[:text]
    flickr = Flickr.new(text).get_list
    impressionist(Card.find(params[:card_id]), "search word #{text}")

    render json: flickr.to_json
  end
end
