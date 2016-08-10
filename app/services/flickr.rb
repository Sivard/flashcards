require 'flickraw'

class Flickr
  def initialize(word)
    word = 'cats' if word.blank?

    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']

    @list = flickr.photos.search(text: word,
                                 tags: word,
                                 content_type: 1,
                                 per_page: 10,
                                 page: rand(100)
                                )
  end

  def get_list
    result = []
    ids_and_secrets_array = @list.map { |r| [r.id, r.secret] }
    ids_and_secrets_array.each do |a|
      flickr.photos.getInfo(photo_id: a[0], secret: a[1])
      sizes = flickr.photos.getSizes(photo_id: a[0])
      hash = {}
      hash[:small_picture] = sizes[0]['source']
      hash[:original_picture] = sizes[-1]['source']

      result << hash
    end

    result
  end
end
