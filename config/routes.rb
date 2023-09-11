Rails.application.routes.draw do
  get "/signup" => "home#signup"
  get "/home" => "home#home"
  post "/create_user" => "home#create_user"
  get "/login" => "home#login"
  post "login_user" => "home#login_user"

  get '/' => "board#home"
  get "/add_ask_question" => "board#add_ask_question"
  get "/add_set_question" => "board#add_set_question"
  get "/content/:id" => "board#content"
  post "/create" => "board#create"
  post "/create_question" => "board#create_question"
  get "/content/:id/question" => "board#content_question"

  get "/ai_question" => "ai_question#home"
  post "/question_for_ai" => "ai_question#question_for_ai"
  
end
