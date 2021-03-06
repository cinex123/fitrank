Rails.application.routes.draw do

  devise_for :users
  resources :gyms do
    resources :comments
    member do
      put "like", to: "gyms#upvote"
      put "dislike", to: "gyms#downvote"
    end
  end

  root 'gyms#index'
end
