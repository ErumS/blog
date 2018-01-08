Rails.application.routes.draw do
  get 'welcome/index'
	resources :articles do
    resources :comments
  end
  resources :comments
 	root 'welcome#index'
end
