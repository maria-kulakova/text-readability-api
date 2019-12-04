class Admin::TextsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.admin?
      @texts = Text.all
      render json: @texts and return
    end

    render json: { message: 'Texts are not found' }
  end

  def show
    if current_user.admin?
      @text = Text.find(params[:id])
      render json: @text and return
    end

    render json: { message: 'Text is not found' }
  end

  def update
    content = text_params[:content]
    result = ReadabilityIndexCalculator.call(content)
    @text = Text.find(params[:id])

    if result.success?
      if @text.update_attributes(content: content, complexity_score: result.readability_index)
        render json: { message: 'Text is successfuly updated' } and return
      end

      render json: { error: @text.errors } and return
    end

    render json: { error: result.error }
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    render json: { message: 'Text is successfuly deleted' }
  end

  private

  def text_params
    params.permit(:content, :complexity_score)
  end
end
