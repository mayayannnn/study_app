class AiQuestionController < ApplicationController
  def home
  end
  def question_for_ai
    @contents= [
      params[:grade],
      params[:subject],
      params[:content],
      params[:number]
    ]
  end
end
