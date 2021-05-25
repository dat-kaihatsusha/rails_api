Rails.application.routes.draw do
  namespace :api do
    resources :diagnoses
    get "questions"  => "diagnoses#questions"
    put "answers"  => "diagnoses#answers"
    get "courses"  => "diagnoses#courses"
    put "period" => "diagnoses#period"
  end
  namespace :api do
    namespace :door do
      namespace :sample do
        resources :posts, only: [:show, :create, :destroy]
      end
    end
    resources :user_publics, only: [:show, :update]
    resources :doors, only: [:show, :update]

    scope :dynamo do
      post '/sample_posts_by_ids', to: "dynamo#sample_posts_by_ids"
    end
  end
  
  # 認証ありAPIテスト用エンドポイント 
  get "/api/ping", to: "api#ping"
  
  get "/health_check", to: "application#health_check"
  get "/", to: proc { [200, Hash.new, Array.new] }

end
