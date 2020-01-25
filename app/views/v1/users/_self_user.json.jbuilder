json.extract! user, :id, :email, :name, :admin, :created_at
json.confirmed user.confirmed?
