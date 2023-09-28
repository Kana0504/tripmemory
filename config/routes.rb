Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'spots/:spot_id/likes' => 'likes#create'
 get 'spots/:spot_id/likes/:id' => 'likes#destroy'
 
#カテゴリー分けに関係するところのみ記載
get 'spots/place' => 'spots#place'
get 'spots/food' => 'spots#food'
get 'spots/souvenir' => 'spots#souvenir'

  resources :spots do
    resources :likes, only: [:create, :destroy]
  end

  root 'spots#index'

end
