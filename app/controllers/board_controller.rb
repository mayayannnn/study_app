class BoardController < ApplicationController
  def home
  end
  def set_question
  end
  def ask_quesiton
  end
  def content
    @borads = Board.where(subject: params[:id])
    @id = params[:id]
    @title = ""
    if params[:id] == "math"
      @title = "数学"
    elsif params[:id] == "japanese"
      @title = "国語"
    elsif params[:id] == "science"
      @title = "理科"
    elsif params[:id] == "society"
      @title = "社会"
    elsif params[:id] == "english"
      @title = "英語"
    elsif params[:id] == "it"
      @title = "情報"
    end
  end
  def content_question
    @questions = Question.where(subject: params[:id])
    @id = params[:id]
    @title = ""
    if params[:id] == "math"
      @title = "数学"
    elsif params[:id] == "japanese"
      @title = "国語"
    elsif params[:id] == "science"
      @title = "理科"
    elsif params[:id] == "society"
      @title = "社会"
    elsif params[:id] == "english"
      @title = "英語"
    elsif params[:id] == "it"
      @title = "情報"
    end
  end
  def create
    @content = Board.new(content:params[:content],
                         subject:params[:subject])
    @content.save
    redirect_to("/")
  end
  def create_question
    @content = Question.new(content:params[:content],
                            subject:params[:subject],
                            answer:params[:answer])
    @content.save
    redirect_to("/")
  end

end
