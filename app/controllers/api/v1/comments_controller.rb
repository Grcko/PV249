module Api
  module V1
    class CommentsController < TasksController
      before_action :set_task, only: [:create]
      before_action :set_comment, only: [:create]

      def show
        @current_time = Time.new.utc.iso8601
        if (lastUpdate != nil)
          @comments = Comment.joins(:task).where('tasks.assignee_id = ?', @user)
                          .where('comments.created_at >= ?', lastUpdate).preload('task')
        else
          @comments = Comment.joins(:task).where('tasks.assignee_id = ?', @user).preload('task')
        end
        render :index
      end

      def create
        return unless validateAssignee
        @comment.save
        render :show
      end

      private
      def set_task
        @task = Task.find(params[:task_id])
      end

      def set_comment
        @comment = Comment.new
        @comment.creator = @user
        @comment.text = params[:text]
        @comment.task = @task
      end

    end
  end
end