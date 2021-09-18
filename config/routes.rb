Rails.application.routes.draw do

  get 'end_users/show'
  get 'end_users/edit'
  get 'end_users/verification'
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

  resources :orders, only: [:index, :show, :new]
  get 'confirm' => 'orders#confirm'
  get 'thanks' => 'orders#thanks'

  resources :end_users, only: [:show, :update, :edit]
  get 'verification' => 'end_users#verification'
end
