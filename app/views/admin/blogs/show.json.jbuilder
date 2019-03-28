json.status 'success'
json.data do
  json.extract! @blog, :id, :title, :category_id, :category_name,
                        :content

end
