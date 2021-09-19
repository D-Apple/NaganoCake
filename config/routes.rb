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
  resources :end_users
 end

  resources :products, only: [:index, :show]

  resources :orders, only: [:index, :show, :new]
  get 'confirm' => 'orders#confirm'
  get 'thanks' => 'orders#thanks'

  resources :end_users, only: [:show, :update, :edit]
  get 'verification' => 'end_users#verification'

end
