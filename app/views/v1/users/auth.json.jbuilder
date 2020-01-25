json.Authorization "Bearer #{@token}"
json.user do
  json.partial! "v1/users/self_user.json.jbuilder", user: @user
end
