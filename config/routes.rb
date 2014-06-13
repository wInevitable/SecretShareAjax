SecretShareAjax::Application.routes.draw do
  
  resources :secrets, :only => [:create]
  resource :session, :only => [:create, :destroy, :new]
  resources :users, :only => [:create, :new, :show, :index] do
    resource :friendship, :only => [:create, :destroy]
    resources :secrets, :only => [:new]
  end
  
  #resources :friendships, :only => []
  
  root :to => "users#show"
end
