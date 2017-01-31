Rails.application.routes.draw do
  resources :articles do
    resources :comments
    get 'remove_tag/:id', to: 'articles#remove_tag', as: 'remove_tag'
    get 'delete', on: :member
    get 'recover', on: :member
  end
  get 'trash', to: 'articles#trash'
  get 'comments', to: 'comments#all_comments'
  delete 'comment/:id', to: 'comments#destroy'

  resources :tags

  root 'articles#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
