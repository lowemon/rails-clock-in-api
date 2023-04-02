Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clock_ins, only: [] do
    collection do
      # API ENDPOINTS FOR CLOCK IN HERE
    end
  end

  resources :follows, only: [] do
    collection do
      # API ENDPOINTS FOR FOLLOWS HERE
    end
  end

  resources :sleep_records, only: [] do
    collection do
      # API ENDPOINTS FOR SLEEP RECORDS HERE
    end
  end

end
