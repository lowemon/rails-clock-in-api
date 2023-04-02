Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index] do
    resources :clock_ins, only: %i[index] do
      post :clock_in, on: :collection
      post :clock_out, on: :member
    end

    resources :follows, only: %i[] do
      get :followed_records, on: :collection
      member do
        post :follow_user
        post :unfollow_user
      end
    end
  end
end
