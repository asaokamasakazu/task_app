Rails.application.routes.draw do
  get 'posts' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/create' => "posts#new"
  post 'posts/create' => "posts#create"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  get 'posts/:id/update' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"
end
