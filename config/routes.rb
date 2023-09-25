Rails.application.routes.draw do
  get "/signup" => "home#signup"
  get "/home" => "home#home"
  post "/create_user" => "home#create_user"
  get "/login" => "home#login"
  post "/login_user" => "home#login_user"
  get "/logout" => "home#logout"
  get "/user/:id" => "home#user"
  get "/user_edit/:id" => "home#user_edit"
  post "/update/:id" => "home#update"

  get '/' => "board#home"
  get "/add_ask_question" => "board#add_ask_question"
  get "/add_set_question" => "board#add_set_question"
  get "/content/:id" => "board#content"
  post "/create" => "board#create"
  post "/create_question" => "board#create_question"
  get "/content/:id/question" => "board#content_question"
  get "/content/:id/solve" => "board#content_solve"
  post "/create_answer" => "board#create_answer"
  get "/content/:id/:board_id" => "board#answer"
  get "/content_question/:id" => "board#answer_question"
  post "/check" => "board#check"
  get "/solve/:id" => "board#solve"


  get "/ai_question" => "ai_question#home"
  post "/question_for_ai" => "ai_question#question_for_ai"

  get "nice/:id/create" => "nice#create"
  get "nice/:id/destroy" => "nice#destroy"

end
