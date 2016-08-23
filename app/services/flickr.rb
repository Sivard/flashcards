require 'flickraw'

class Flickr
  def initialize(word)
    @word = word.present? ? word : 'cat'

    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
  end

  def get_list
    Rails.cache.fetch("flickr/#{@word}", expires_in: 6.hours) do
      results = {}
      results[:data] = []
      
      list = flickr.photos.search(text: @word,
                                  tags: @word,
                                  content_type: 1,
                                  per_page: 10,
                                  page: rand(100)
                                 )

      ids_and_secrets_array = list.map { |r| [r.id, r.secret] }
      ids_and_secrets_array.each do |a|
        flickr.photos.getInfo(photo_id: a[0], secret: a[1])
        sizes = flickr.photos.getSizes(photo_id: a[0])
        hash = {}
        hash[:small_picture] = sizes[0]['source']
        hash[:original_picture] = sizes[-1]['source']

        results[:data] << hash
      end

      results
    end
  end
end
