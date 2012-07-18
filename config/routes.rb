SimpleFormDemo::Application.routes.draw do
  resources :roles

  resources :users
  root :to => 'users#index'
end
