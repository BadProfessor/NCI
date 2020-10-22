Rails.application.routes.default_url_options[:host] = "jarbar.website"
Rails.application.routes.draw do
  resources :adds
  
  namespace 'api' do
    namespace 'v1' do
      resources :api
    end
  end
  
  resources :chats do
    resources :messages
  end
      root "adds#index"
     devise_for :users, :controllers => { registrations: 'registrations' }

  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "tweet" => "tweet#Tweet"
  get "myads" => "adds#myads"
  get "search" => "adds#search"
  get "blog" => "blog#index"
end
