module TasksHelper
  def setup_task(task)
    task.address ||= Address.new
    task
  end
end
