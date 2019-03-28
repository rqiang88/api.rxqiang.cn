json.status :success
json.data do 
  json.extract! @att, :id
  json.url Settings.url.to_s + @att.att.url
end