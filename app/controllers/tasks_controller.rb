class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(company: current_user.company)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    set_new_comment
  end

  # GET /tasks/new
  def new
    @task = Task.new
    set_workers
  end

  # GET /tasks/1/edit
  def edit
    set_workers
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.creator = current_user
    @task.company = current_user.company
    @task.state = State.find(STATE_NEW)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        set_workers
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    puts 'Controller creator'
    puts @task.creator
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        set_workers
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_new_comment
      @comment = Comment.new
    end

  private
    def set_workers
      @workers = User.where(company: current_user.company).with_role :worker
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:desc, :assignee_id, :time, address_attributes: [:street, :number, :city, :country])
    end
end
