class BoardController < ApplicationController
  before_action :authenticate_user
  def home
    @boards = Board.where(user_id: session[:user_id]).order(created_at: :desc)
  end
  def set_question
  end
  def ask_quesiton
  end
  def content 
    @boards = Board.where(subject: params[:id],solve: "未解決").order(created_at: :desc)
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


  def content_solve
    @board_solves = Board.where(subject: params[:id],solve: "解決済み").order(created_at: :desc)
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
    @questions = Question.where(subject: params[:id]).order(created_at: :desc)
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
      grade:params[:grade],
      user_id:session[:user_id],
      solve: "未解決",
      image: nil)
    @content.save
    if params[:image]
      @content.image = "#{@content.id}.jpg"
      image = params[:image]
      File.binwrite("public/content_images/#{@content.id}.jpg",image.read)
      @content.save
    end
    redirect_to("/")
  end
  def create_question
    @content_question = Question.new(content:params[:content],
                            subject:params[:subject],
                            answer:params[:answer],
                            grade:params[:grade],
                            user_id:session[:user_id])
    @content_question.save
    redirect_to("/")
  end
  def answer
    @board = Board.find_by(id: params[:board_id])
    @answers = BoardAnswer.where(board_id: params[:board_id])
  end
  def create_answer
    @answer = BoardAnswer.new(board_id: params[:board_id],
                              answer: params[:answer],
                              user_id:session[:user_id])
    @answer.save
    redirect_to("/")
  end
  def answer_question
    @question = Question.find_by(id: params[:id])
  end
  def check
    @question = Question.find_by(id: params[:id])
    @answer = params[:answer]
  end
  def solve
    @board = Board.find_by(id: params[:id])
    @board.solve = "解決済み"
    @board.save
    redirect_to("/home")
  end
end
