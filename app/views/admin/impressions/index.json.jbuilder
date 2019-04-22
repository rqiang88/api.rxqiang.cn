json.status 'success'
i, page = 1, params[:page].to_i > 0 ? params[:page].to_i - 1 : 1
start_page_index = (params[:page].to_i - 1).to_i * @per_page.to_i

json.data @impressions do |impresseion|
  json.extract! impresseion, :id, :controller_name, :action_name, 
                             :ip_address, :created_at
  json.user_name '访客'
  json.index start_page_index + i
  i = i + 1
end

json.partial! 'admin/page', data: @impressions