require 'nokogiri'
require 'open-uri'

class WordsParser
  WordObj = Struct.new(:original_css, :translated_css, :url, :block_id)

  def initialize(user_id, params)
    @word = WordObj.new(params[:original_css],
                        params[:translated_css],
                        params[:url],
                        params[:block_id])

    @user_id = user_id

    Log.create(user_id: @user_id, status: 0, msg: 'Начало загрузки')
  end

  def run
    doc = Nokogiri::HTML(open(@word.url))

    original   = doc.search(@word.original_css)[0].content.downcase
    translated = doc.search(@word.translated_css)[0].content.downcase

    Card.create(original_text: original, translated_text: translated, user_id: @user_id, block_id: @word.block_id)
    Log.create(user_id: @user_id, status: 0, msg: "Успешная загрузка карточки #{translated}")
  rescue
    Log.create(user_id: @user_id, status: 1, msg: 'Перевод не загружен')
  end
end
