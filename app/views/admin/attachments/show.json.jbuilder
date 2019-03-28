json.status :success
json.data do 
  json.extract! @att, :id
  json.url @att.att.url
end