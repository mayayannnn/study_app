class NiceController < ApplicationController
    def create
        @nice = Nice.new(
            user_id: session[:user_id],
            question_id: params[:id]
        )
        @nice.save
        redirect_to("/home")
    end
    def destroy
        @nice = Nice.find_by(
            user_id: session[:user_id],
            question_id: params[:id]
        ) 
        @nice.destroy
        redirect_to("/home")
    end
end