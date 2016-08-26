class Dashboard::StatisticsController < Dashboard::BaseController
  def index
    @statistics_current_user = Impression.where(user_id: current_user.id)
    @statistics_other_actions = Impression.where(user_id: nil)
  end
end
