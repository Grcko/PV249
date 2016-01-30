json.time @current_time
json.tasks @tasks do |task|
  json.extract! task, :id, :desc, :time
  json.extract! task.address, :street, :number, :city, :country
  json.set! 'state', task.state.id
end
json.deleted @deleted do |item|
  json.set! 'id', item.task_id
end
