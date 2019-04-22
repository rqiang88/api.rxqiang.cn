class Admin::ImpressionsController < Admin::ApplicationController
  before_action :set_page, only: [:index]
  
  def index
    @impressions = Impression.order(id: :desc)
                              .page(params[:page])
  end
end
