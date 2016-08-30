class Dashboard::StatisticsController < Dashboard::BaseController
  def index
    if params[:q].nil?
      @statistics = []
    else
      params[:user_id] = current_user.id
      @statistics = Statistic.esearch(params).results
    end
  end
end
