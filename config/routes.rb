Rails.application.routes.draw do
  
  devise_for :users
  get 'home/index'
  root to: 'readers/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  scope module: 'users' do
    resources :posts do
      resources :elements
    end
  end
end
