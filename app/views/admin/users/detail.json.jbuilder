json.status 'success'
json.data do 
  json.extract! @current_admin, :id, :mobile, :name, :token
  json.roles ['admin']
end