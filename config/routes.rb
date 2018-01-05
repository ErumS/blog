Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments do
    	resources :feedbacks
    end
  end
 
  root 'welcome#index'
end
