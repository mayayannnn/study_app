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
    redirect_to("/content/#{@content.subject}", success: "作成しました")
  end
  def create_question
    @content_question = Question.new(content:params[:content],
                            subject:params[:subject],
                            answer:params[:answer],
                            grade:params[:grade],
                            user_id:session[:user_id])
    @content_question.save
    redirect_to("/content/#{@content_question.subject}/question", success: "作成しました")
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
    @board = Board.find_by(id: @answer.board_id)
    redirect_to("/content/#{@board.subject}/#{@board.id}", success: "作成しました")
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
    redirect_to("/content/#{@board.subject}/solve", success: "変更しました")
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    if @board.user_id.to_i == session[:user_id].to_i

      @board.destroy
      redirect_to("/content/#{@board.subject}", danger: "削除しました")
    else
      redirect_to("/")
    end
    
      
  end


  def edit
    @board = Board.find_by(id: params[:id])
    if @board.user_id.to_i == session[:user_id].to_i
      @title = ""
      if @board.subject == "math"
        @title = "数学"
      elsif @board.subject == "japanese"
        @title = "国語"
      elsif @board.subject == "science"
        @title = "理科"
      elsif @board.subject == "society"
        @title = "社会"
      elsif @board.subject == "english"
        @title = "英語"
      elsif @board.subject == "it"
        @title = "情報"
      end
    else
        redirect_to("/content/#{@board.subject}")
    end
  end


  def update
    @board = Board.find_by(id: params[:id])
    if @board.user_id.to_i == session[:user_id].to_i
      if params[:image]
        @board.image = params[:image]
        iamge = params[:image]
        File.binwrite("public/user_images/#{@board.image}",image.read)
      end
      if params[:content]
        @board.content = params[:content]
      end
      if params[:subject]
        @board.subject = params[:subject]
      end
      if params[:grade]
        @board.grade = params[:grade]
      end
      @board.save
    end
      redirect_to("/content/#{@board.subject}", success: "変更しました")
  end



  def edit_question
    @question = Question.find_by(id: params[:id])
    if @question.user_id.to_i == session[:user_id].to_i
      @title = ""
      if @question.subject == "math"
        @title = "数学"
      elsif @question.subject == "japanese"
        @title = "国語"
      elsif @question.subject == "science"
        @title = "理科"
      elsif @question.subject == "society"
        @title = "社会"
      elsif @question.subject == "english"
        @title = "英語"
      elsif @question.subject == "it"
        @title = "情報"
      end
      
    end
  end

  def update_question
    @question = Question.find_by(id: params[:id])
    if @question.user_id.to_i == session[:user_id].to_i
      @question.content = params[:content]
      @question.answer = params[:answer]
      if params[:subject]
        @question.subject = params[:subject]
      end
      if params[:grade]
        @question.grade = params[:grade]
      end
      @question.save
      
    end
    redirect_to("/content/#{ @question.subject }/question", success: "変更しました")
  end
  
  def destroy_question
    @question = Question.find_by(id: params[:id])
    if @question.user_id.to_i == session[:user_id]
      @question.destroy
      redirect_to("/content/#{@question.subject}/question", danger: "削除しました")
    else
      redirect_to("/")
    end
  end

  def edit_answer
    @answer = BoardAnswer.find_by(id: params[:id])
    @board = Board.find_by(id: @answer.board_id)
    if @board.user_id.to_i != session[:user_id].to_i
      redirect_to("/content/#{@board.subject}/#{@baord.id}")
    end
  end

  def update_answer
    @answer = BoardAnswer.find_by(id: params[:id])
    @board = Board.find_by(id: @answer.board_id)
    if @board.user_id.to_i == session[:user_id].to_i
      @answer.answer = params[:answer]
      @answer.save
    end
    redirect_to("/content/#{@board.subject}/#{@board.id}", success: "変更しました")
  end

  def destroy_answer
    @answer = BoardAnswer.find_by(id: params[:id])
    @board = Board.find_by(id: @answer.board_id)
    if @board.user_id.to_i == session[:user_id]
      @answer.destroy
    end
      redirect_to("/content/#{@board.subject}/#{@board.id}", danger: "削除しました")
  end
end
