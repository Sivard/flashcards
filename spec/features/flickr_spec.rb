require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'Flickr service' do
  let(:user) { create(:user_with_one_block_and_one_card) }

  let(:body) do
    {"format"=>"json", "method"=>"flickr.reflection.getMethods", "nojsoncallback"=>"1"}
  end

  let(:response) do
    {
      'Accept'=>'*/*', 
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
      'Authorization'=>'OAuth realm="https://api.flickr.com/services/rest/", oauth_consumer_key="d52d28cecf90fccbb2209339bc48430a", oauth_nonce="9RA%2F0Q1V0vioUo2C%2FTS6MU%2Fz6ysCjd1QMZz2rUbGsZg%3D", oauth_signature="878cf945c24fe5c8%26", oauth_signature_method="PLAINTEXT", oauth_timestamp="1470835797", oauth_token="", oauth_version="1.0"',
      'Content-Type'=>'application/x-www-form-urlencoded', 
      'User-Agent'=>'FlickRaw/0.9.9'
    }
  end

  before(:each) do
    stub_request(:post, "https://api.flickr.com/services/rest/").with(body: body, headers: response)
                                                                .to_return(status: 200, body: "", headers: {})
  end



  before do
    visit trainer_path
    login(user.email, '12345', 'Войти')
    card = user.cards.first
    visit edit_card_path(card)
  end

  it 'edit card page' do
    expect(page).to have_content 'Загрузить из Flickr'
  end

  it 'click flickr link and open modal' do
    click_link 'Загрузить из Flickr'
    # Так
    # click_button 'Найти во Flickr'
    # или сразу напрямую
    Flickr.new('dogs').get_list
  end
end