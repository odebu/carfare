  Carfare::Application.routes.draw do
 
  # 申請者用トップとログイン周りのルーティング
  devise_for :users
  get 'months', :to => 'months#index', :as => :user_root  

  # 承認者用トップとログイン周りのルーティング
  get "admin_welcome/index"

  devise_for :admins, :controllers =>  {:registrations => :registrations}
  get 'recognitions', :to => 'recognitions#index', :as => :admin_root

  # 経理用トップとログイン周りのルーティング  
  get "accounting_welcome/index"

  devise_for :accountings
  get 'accountings', :to => 'accountings#index', :as => :acccounting_root 

  # 申請者用画面のルーティング  
  resources :months do
    put :application, :on => :member
    put :withdrawn, :on => :member
    resources :fares
  end

  # 承認者用画面のルーティング
  match "/recognitions/show" => "recognitions#show"
  get '/recognitions/:id' => "recognitions#expenses_check"

  resources :recognitions, :only => [ :index ] do 
    put :recognition, :on => :member
    put :rejection, :on => :member
  end

  # 経理用画面のルーティング
  resources :accountings, :only => [ :index ] do 
  end

  get '/accountings/:id' => "accountings#expenses_check"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
