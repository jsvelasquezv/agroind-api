Rails.application.routes.draw do

  # mount_devise_token_auth_for 'User', at: 'auth'
  # namespace :api do
  #   scope :v1 do
  #   end
  # end
  devise_for :user

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: 'auth'
      get '/users' => 'users#index'
      get '/users/:id' => 'users#show'
      post '/users' => 'users#create'
      delete '/users/:id' => 'users#destroy'
      patch '/users/:id' => 'users#update'
      resources :profiles
      resources :lands
      resources :indicators
      resources :variables
      resources :evaluations
      # resources :scores
      resources :color_codes
      get 'evaluations/:evaluation_id/qualifications/indicator/:indicator_id' => 'evaluations#qualifications'
      get 'evaluations/indicators/averages/:evaluation_id' => 'evaluations#indicator_variables_averages'
      post 'evaluations/qualify' => 'evaluations#qualify'
      post 'evaluations/batch/create' => 'evaluations#batch_create'
      post 'evaluations/:evaluation_id/analysis' => 'evaluations#add_analysis'
      post 'evaluations/:evaluation_id/recommendation' => 'evaluations#add_recommendation'
      patch 'evaluations/batch/update' => 'evaluations#batch_update'
      post 'evaluations/batch/qualify' => 'evaluations#batch_qualify'
      get 'statistics/ranking/best' => 'statistics#ranking_best'
      get 'statistics/ranking/worst' => 'statistics#ranking_worst'
      get 'statistics/graphics/radar/start_date/:start_date/end_date/:end_date' => 'statistics#radar_data_between_dates'
      get 'statistics/evaluation/:evaluation_id' => 'statistics#evaluation_report'
    end
  end

  get '/ping' => 'application#ping', :defaults => { :format => 'json' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
