json.status 'success'
json.data @blogs do |c|
  json.extract! c, :id, :title, :category_name, :aasm_state, :created_at
end

json.partial! 'shared/page', data: @blogs