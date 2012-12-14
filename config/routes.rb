Mendel::Application.routes.draw do
  resources :companies

  devise_for :users


  match '/museum/blog' => redirect('/museum-blog')
  match '/museum/add_exhibitions' => 'museum#add_exhibitions', :as => :add_exhibitions
  match '/museum' => 'museum#index', :as => :museum
  match '/museum/:short_url' => 'statics#show'

  match '/about' => 'statics#show', :short_url => "about"
  match '/about/:short_url' => 'statics#show'

  resources :statics

  match '/exhibits/update/:id/:title' => 'exhibits#update'
  match '/exhibits/destroy/:id' => 'exhibits#destroy'
  match '/exhibits/upload' => 'exhibits#upload'
  resources :exhibits


  match '/search' => 'search#results'

  resources :album_images

  resources :articles

  resources :categories

  match '/news' => 'categories#index'

  match '/photo/:short_url' => 'albums#index'
  resources :albums

  match ':short_url' => 'categories#show'

  root :to => 'welcome#index'

end
