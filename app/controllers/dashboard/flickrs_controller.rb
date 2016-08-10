class Dashboard::FlickrsController < ApplicationController
  def index
    text = params[:text]
    @flickr = Flickr.new(text).get_list

    render layout: false
  end
end