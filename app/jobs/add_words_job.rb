class AddWordsJob < ApplicationJob
  queue_as :default

  def perform(*params)
    WordsParser.new(*params).run
  end
end
