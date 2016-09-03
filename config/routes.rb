Rails.application.routes.draw do

  root  'home_pages#index'
  get    'new_idea'   => 'ideas#new'
  get    'new_category'   => 'categories#new'

  get    'about'   => 'static_pages#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  


  resources :users
  resources :ideas
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
