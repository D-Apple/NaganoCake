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


  root 'homes#top'
  get 'about' => 'homes#about'

  resources :products, only: [:index, :show]

  resources :orders, only: [:index, :create, :show, :new]
  post 'confirm' => 'orders#confirm'
  get 'thanks' => 'orders#thanks'

  resources :end_users, only: [:update,]
  get 'mypage' => 'end_users#show'
  get 'mypage/edit' => 'end_users#edit'
  get 'verification' => 'end_users#verification'
  patch 'withdrawal' =>  'end_users#withdrawal'

  resources :cart_products, only: [:index, :create, :update, :destroy]
  delete 'destroy_all' => 'cart_products#destroy_all'

  resources :addresses, only: [:index, :create, :destroy, :edit, :update]

  namespace :admins do
    resources :products, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
 end

end
