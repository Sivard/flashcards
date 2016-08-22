require 'nokogiri'
require 'open-uri'

class WordsParser
  Parameters = Struct.new(:original_css, :translated_css, :url, :block_id)

  def initialize(user_id, params)
    @user_id = user_id
    @param = Parameters.new(params[:original_css],
                            params[:translated_css],
                            params[:url],
                            params[:block_id])

    Log.create(user_id: @user_id, status: 0, msg: 'Начало загрузки')
  end

  def run
    doc = Nokogiri::HTML(open(@param.url))

    original_list   = doc.css(@param.original_css).map(&:content)
    translated_list = doc.css(@param.translated_css).map(&:content)

    count = original_list.count
    count.times do |i|
      Card.create(original_text: original_list[i],
                  translated_text: translated_list[i],
                  user_id: @user_id,
                  block_id: @param.block_id)
    end
    Log.create(user_id: @user_id, status: 0, msg: "Успешно загружено #{count} карточек")
  rescue
    Log.create(user_id: @user_id, status: 1, msg: 'Перевод не загружен')
  end
end
