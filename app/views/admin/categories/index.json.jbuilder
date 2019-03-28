json.status "success"
json.data @categories do |category|
  json.extract! category, :id, :name, :created_at
end

json.partial! 'admin/page', data: @categories