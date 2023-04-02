Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index] do
    resources :clock_ins, only: %i[index clock_in clock_out]
    resources :follows, only: %i[followed_records follow_user unfollow_user]
  end
end
