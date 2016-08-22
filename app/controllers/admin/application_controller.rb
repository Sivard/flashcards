# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController #< Administrate::ApplicationController
    # include Pundit
    # before_action :require_login
    # before_action :authenticate_admin

    # def authenticate_admin
    #   unless current_user.is_admin?
    #     redirect_to root_path, alert: 'Для администрирования недостаточно прав'
    #   end
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  private
    def resource_params
      params.require(resource_name).permit(dashboard.permitted_attributes)
    end
  end
end
