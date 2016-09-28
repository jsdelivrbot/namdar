Rails.application.routes.draw do
  resources :articles do
    resources :comments
    get 'remove_tag/:id', to: 'articles#remove_tag', as: 'remove_tag'
  end

  resources :tags

  root 'articles#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
