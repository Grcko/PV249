module Api
  module V1
    class TasksController < ApiController
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
    end
  end
end
