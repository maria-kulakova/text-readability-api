class TextsController < ApplicationController
  load_and_authorize_resource

  def index
    @texts = Text.where(user: current_user)

    render json: { texts: @texts }
  end

  def show
    @text = Text.find(params[:id])

    if @text.user == current_user
      render json: { text: @text } and return
    end

    render json: { message: 'Text is not found' }
  end

  private

  def text_params
    params.permit(:content, :complexity_score)
  end
end
