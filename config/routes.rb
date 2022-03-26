Rails.application.routes.draw do
  resources :speaks do
    collection do
      post :confirm
    end
  end
end
