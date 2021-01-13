Rails.application.routes.draw do

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  root to: 'homes#top'
  get "/about" => "homes#about"

  namespace :admins do
    resources :customers
    resources :circles
    resources :genres, :only => [:index, :create, :edit, :update, :destroy]
  end

    
  
  scope module: :customers do
    resources :customers,:except => [:show, :edit, :new, :create] do
      resources :circles
      get "/my_page" => "customers#show"
      get "/my_page/edit" => "customers#edit"
      get "/unsubscribe" => "customers#unsubscribe"
      patch "/withdraw" => "customers#withdraw"
    end
  end
  
end   

#一つ目の「customers」はデバイスのリソース
#2つ目の「customers」は
  # scope module: :customers do
  #   resources :customer,:exept => [:show, :edit, :destroy] do
  #   resources :circles 
  #   collection do
  #   get "/my_page" => "customers#show"
  #   get "/my_page/edit" => "customers#edit"
  #   patch "/my_page/update" => "customers#update"
  #   get "/unsubscribe" => "customers#unsubscribe"
  #   patch "/withdraw" => "customers#withdraw"
  #   get "/my_circle/new" => "circles#new"
  #   get "/my_circles" => "circles#index"
  #   get "/my_circle" => "circles#show"
  #   get "/my_circle/edit" => "circles#edit"
  #   patch "/my_circle/update" => "circles#update"
  #   delete "/unsubscribe" => "circles#destroy"
  #   end
  # end
  # end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

