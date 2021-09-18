Rails.application.routes.draw do
 devise_for :admins, controllers: {
   sessions: 'admins/sessions',
   passwords: 'admins/passwords',
   registrations: 'admins/registrations'
 }
 
 devise_for :end_users, controllers: {
   sessions: 'end_users/sessions',
   passwords: 'end_users/passwords',
   registrations: 'end_users/registrations'
 }
 
 root to: 'homes#top'
 get 'homes/about' => 'homes#about'
 
 
 namespace :admins do
  resources :products, only:[:new, :create, :index, :show, :edit, :update]
  resources :genres, only:[:index, :create, :edit, :update]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
