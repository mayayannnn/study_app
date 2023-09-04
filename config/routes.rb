Rails.application.routes.draw do
  get 'ai_question/home'

  get '/' => "board#home"
  get "/add_ask_question" => "board#add_ask_question"
  get "/add_set_question" => "board#add_set_question"
  get "/content/:id" => "board#content"
  post "/create" => "board#create"
  post "/create_question" => "board#create_question"
  get "/content/:id/question" => "board#content_question"

  get "/ai_question" => "ai_question#home"
  get "/question_for_ai" => "ai_question#question_for_ai"
  
end
