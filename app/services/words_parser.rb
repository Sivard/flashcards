require 'nokogiri'
require 'open-uri'

class WordsParser
  def initialize(*params)
    @user_id = params[0]
    @original_css = params[1]
    @translated_css = params[2]
    @url = params[3]
    @block_id = params[4]

    Log.create(user_id: @user_id, status: 0, msg: 'Начало загрузки')
  end

  def run
    doc = Nokogiri::HTML(open(@url))

    original_list   = doc.css(@original_css).map(&:content)
    translated_list = doc.css(@translated_css).map(&:content)

    count = original_list.count
    count.times do |i|
      Card.create(original_text: original_list[i],
                  translated_text: translated_list[i],
                  user_id: @user_id,
                  block_id: @block_id)
    end
    Log.create(user_id: @user_id, status: 0, msg: "Успешно загружено #{count} карточек")
  rescue
    Log.create(user_id: @user_id, status: 1, msg: 'Перевод не загружен')
  end
end
