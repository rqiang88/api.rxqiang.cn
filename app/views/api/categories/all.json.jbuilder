json.status 'success'
json.data @categories do |category|
  json.extract! category, :id, :name
end 