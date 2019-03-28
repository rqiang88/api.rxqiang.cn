class Admin::AttachmentsController < Admin::ApplicationController
  def create
    @att = Attachment.create(att: params[:file])
    if @att.save
      render :show
    else
      response_error(@att)
    end
  end

  def show
  end

  private

  def attachment_params
    params.require(:att)
  end
end
