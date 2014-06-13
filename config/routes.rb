SecretShareAjax::Application.routes.draw do
  resources :friendships, :only => [:create]

  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, :only => [:new]
    resources :friendships, :only => [:new]
  end
  resource :session, :only => [:create, :destroy, :new]
  
  resources :secrets, :only => [:create]
  
  root :to => "users#show"
end
