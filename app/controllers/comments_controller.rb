class CommentsController < TasksController
  before_action :set_task, only: [:create, :edit, :update]

  def create
    comment = Comment.new(comment_params)
    comment.task_id=params[:id]
    comment.creator=current_user
    comment.save
    redirect_to @task
    end

  def edit

  end

  def update

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text)
  end

end