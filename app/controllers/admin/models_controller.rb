module Admin
  class ModelsController < AdminController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @models = Model.all
    end
  end
end
