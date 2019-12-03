class TextsController < ApplicationController
  load_and_authorize_resource

  def create
    content = text_params[:content]

    result = ReadabilityIndexCalculator.call(content)

    if result.success?
      Text.create(content: content, complexity_score: result.readability_index)

      render json: { message: 'Successfuly created!' }
    else
      render json: { error: result.error }
    end
  end

  private

  def text_params
    params.permit(:content, :complexity_score)
  end
end
