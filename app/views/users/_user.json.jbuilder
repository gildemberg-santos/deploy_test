json.extract! user, :id, :nome, :email, :password, :drescricao, :created_at, :updated_at
json.url user_url(user, format: :json)