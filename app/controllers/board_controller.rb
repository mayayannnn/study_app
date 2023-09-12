class BoardController < ApplicationController
  def home
  end
  def set_question
  end
  def ask_quesiton
  end
  def content
    @boards = Board.where(subject: params[:id])
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
                         subject:params[:subject],
                         grade:params[:grade]
                         )
    @content.save
    redirect_to("/")
  end
  def create_question
    @content = Question.new(content:params[:content],
                            subject:params[:subject],
                            answer:params[:answer],
                            grade:params[:grade])
    @content.save
    redirect_to("/")
  end
  def answer
    @board = Board.find_by(id: params[:board_id])
    @answers = BoardAnswer.where(board_id: params[:board_id])
  end
  def create_answer
    @answer = BoardAnswer.new(board_id: params[:board_id],
                              answer: params[:answer])
    @answer.save
    redirect_to("/")
  end
end
