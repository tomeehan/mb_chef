json.extract! staff, :id, :first_name, :surname, :email, :job_title, :manager, :pin, :created_at, :updated_at
json.url staff_url(staff, format: :json)