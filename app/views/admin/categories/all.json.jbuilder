json.status 'success'
json.data @categories do |c|
	json.label c.name
	json.value c.id
end