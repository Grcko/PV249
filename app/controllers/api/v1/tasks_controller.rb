module Api
  module V1
    class TasksController < ApiController
      before_action :set_task, only: [:update]

      def index
        @current_time = Time.new.utc.iso8601
        lastUpdate = params[:lastUpdate]
        if (lastUpdate != nil)
          @tasks = Task.where(assignee_id: @user.id).where('updated_at >= ?', lastUpdate)
          @deleted = DeletedTask.where(assignee_id: @user.id).where('created_at >= ?', lastUpdate)
        else
          @tasks = Task.where(assignee_id: @user.id)
        end
        render :index
      end

      def update
        return unless validateAssignee
        @task.update(state: State.find(params[:state]))
        render :show
      end

      private
      def set_task
        @task = Task.find(params[:id])
      end

      def validateAssignee
        return true if @task.assignee == @user
        render json: {
            message: "Not authorized"
        }, status: 403
        return false
      end

      def update_params
        params.require(:task).permit(:state)
      end

    end
  end
end
