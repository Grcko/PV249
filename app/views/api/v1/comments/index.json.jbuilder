json.time @current_time
json.comments @comments do |comment|
  json.extract! comment, :text, :created_at
  json.set! 'task_id', comment.task.id
  json.set! 'creator', comment.creator.name + ' ' + comment.creator.surname
end
