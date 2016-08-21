require 'nokogiri'
require 'open-uri'

class Word
  WordObj = Struct.new(:original_css, :translated_css, :url, :block_id)

  def initialize(params, user_id)
    @word = WordObj.new(params[:original_css],
                        params[:translated_css],
                        params[:url],
                        params[:block_id])

    @user_id = user_id
  end

  def run
    doc = Nokogiri::HTML(open(@word.url))

    original   = doc.search(@word.original_css)[0].content.downcase
    translated = doc.search(@word.translated_css)[0].content.downcase

    Card.create(original_text: original, translated_text: translated, user_id: @user_id, block_id: @word.block_id)
  rescue
    puts 'Перевод не загружен'
  end
end