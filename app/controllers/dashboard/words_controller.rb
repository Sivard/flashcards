class Dashboard::WordsController < Dashboard::BaseController
  respond_to :html

  def index
    @blocks = current_user.blocks.order('title').pluck(:title, :id)
  end

  def create
    AddWordsJob.perform_later(current_user.id,
                              word_params[:original_css],
                              word_params[:translated_css],
                              word_params[:url],
                              word_params[:block_id])
    redirect_to root_path, flash: {notice: "Обработка страницы поставленна в очередь. <a href='/status'>Проверить результат</a>."}
  end

  private

  def word_params
    params.require(:word).permit(:original_css,
                                 :translated_css,
                                 :url,
                                 :block_id)
  end
end
