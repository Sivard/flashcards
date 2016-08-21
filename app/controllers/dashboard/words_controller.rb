class Dashboard::WordsController < Dashboard::BaseController
  respond_to :html

  def index
    @blocks = current_user.blocks.order('title').pluck(:title, :id)
  end

  def create
    AddWordsJob.perform_later(word_params, current_user.id)
    redirect_to root_path, flash: {notice: 'Обработка страницы поставленна в очередь. Ожидайте.'}
  end

  private

  def word_params
    params.require(:word).permit(:original_css,
                                 :translated_css,
                                 :url,
                                 :block_id)
  end
end
