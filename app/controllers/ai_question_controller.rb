class AiQuestionController < ApplicationController
  
  before_action :authenticate_user
  def home
  end

  def question_for_ai
    @contents= [
      params[:grade],
      params[:subject],
      params[:content],
      params[:number]
    ]
    @content = "#{@contents[0]} の #{@contents[1]} の #{@contents[2]} について  #{@contents[3]} 問、問題を出してください"
    # @key = ENV['OPEN_AI_API_KEY']

    # @client = OpenAI::Client.new(access_token: @key)
    # response = @client.chat(
    #   parameters: {
    #       model: "gpt-3.5-turbo",
    #       messages: [{ role: "user", content: @content }],
    #   })

    # @chats = response.dig("choices", 0, "message", "content")
    @chats = "問題1: 方程式 $2x-5=7$ の解を求めよ。 問題2: 方程式 $\frac{3}{4}y + 2 = \frac{1}{2}y - 1$ の解を求めよ。 問題3: 方程式 $4(x+3) = 2(x-1)+7$ の解を求めよ。"
  end
  
  def question_for_ai_answer
    @chats = params[:chats]
    @contents = [
      params[:contents_0],
      params[:contents_1],
      params[:contents_2],
      params[:contents_3]
    ]
    @content = "#{@contents[0]} の #{@contents[1]} の #{@contents[2]} について  #{@contents[3]} 問、問題を出してください"
    # @key = ENV['OPEN_AI_API_KEY']

    # @client = OpenAI::Client.new(access_token: @key)
    # response = @client.chat(
    #   parameters: {
    #       model: "gpt-3.5-turbo",
    #       messages: [{ role: "user", content: #{@content}の答えを教えてください }],
    #   })

    # @answer = response.dig("choices", 0, "message", "content")
    @answer = "答え"
  end
end
