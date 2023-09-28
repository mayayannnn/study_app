class NiceController < ApplicationController
    def create
        @question = Question.find_by(id: params[:id])
        @nice = Nice.new(
            user_id: session[:user_id],
            question_id: params[:id]
        )

        @nice.save
        redirect_to("/content/#{@question.subject}/question")
    end
    def destroy
        @question = Question.find_by(id: params[:id])
        @nice = Nice.find_by(
            user_id: session[:user_id],
            question_id: params[:id]
        ) 
      
        @nice.destroy
        redirect_to("/content/#{@question.subject}/question")
    end
end