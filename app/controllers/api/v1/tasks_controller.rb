module Api
  module V1
    class TasksController < ApiController
      def index
        @current_time = Time.new.utc.iso8601
        @tasks = Task.where(assignee_id: @user.id)
        render :index
        # render json: {
        #     tasks: tasks, :include => :address,
        #     time: current_time
        # }
      end
    end
  end
end
