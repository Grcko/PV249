json.extract! @task, :id, :desc, :time
json.extract! @task.address, :street, :number, :city, :country
json.set! 'state', @task.state.id
