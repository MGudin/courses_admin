json.extract! student, :id, :name, :last_name, :dni, :student_number, :created_at, :updated_at
json.url student_url(student, format: :json)
