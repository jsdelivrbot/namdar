Rails.application.routes.draw do
  get 'tags/new'

  resources :articles do
    resources :comments
  end

  resources :tags

  root 'welcome#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
