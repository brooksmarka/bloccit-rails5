Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsoredposts

  end

  get 'about' => 'welcome#about'

  root "welcome#index"
end
