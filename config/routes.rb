Rails.application.routes.draw do
  namespace :api do
    resources :diagnoses
    get "questions" => "diagnoses#questions"
    put "answers" => "diagnoses#answers"
    get "courses" => "diagnoses#courses"
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

    #api account
    put '/account', to: "accounts#create"
    delete '/account/:id', to: "accounts#destroy"
    get '/account', to: "accounts#index"
    #api get token
    put '/token', to: "authentications#token"
    #api logout token
    delete "/logout", to: "authentications#revoke_token"
    #api plan
    get '/plan', to: "plans#index"
    put '/plan', to: "plans#create"
    delete '/plan/:id', to: "plans#destroy"
    get '/recommend_plan', to: "plans#recommend"
    #api music list
    get '/music_list', to: "plans#music_list"
    #api record
    put '/record', to: "plans#record"
    #api love list
    get '/love_list', to: "plans#love_list"
    # match 'photos', to: 'photos#show', via: [:get, :post]
    #api create love
    match '/create_love', to: 'plans#create_love', via: [:put, :delete]
    #api create time
    match '/create_time', to: 'plans#create_time', via: [:put, :delete]
    #api result list
    get '/result', to: "plans#result"
    #api dashboard
    get '/dashboard', to: "plans#dashboard"
  end

  # 認証ありAPIテスト用エンドポイント 
  get "/api/ping", to: "api#ping"

  get "/health_check", to: "application#health_check"
  get "/", to: proc { [200, Hash.new, Array.new] }

end
