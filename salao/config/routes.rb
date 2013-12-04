Salao::Application.routes.draw do
  resources :pagamentos


  resources :statuspagamentoes


  resources :formapagamentoes


  resources :categories


  resources :realizas


  resources :servicos


  resources :categorias


  resources :clientes


  resources :pessoas


  devise_for :usuarios
  authenticated :usuarios do
    root :to => "realizas#agenda_hoje"
  end

  root :to => "index#index"


  match "/" ,:controller=>"index" , :action=>"index"
  match "/cadastrar_cliente/passo1", :controller=>"index"  , :action=>"cadastrar_cliente"
  match "/cadastrar_cliente/passo2/:id", :controller=>"index"  , :action=>"cadastrar_cliente2"
  match "/aniversariente_cliente" , :controller=>"clientes" , :action=>"aniversariante"
  match "/cliente/servico/:id" , :controller=>"clientes" , :action=>"servicos"
  match "/agenda_hoje" , :controller=>"realizas" , :action=>"agenda_hoje"
  match "/confirmar/:id" , :controller=>"realizas" , :action=>"confirmar"
  match "/cancelar/:id" , :controller=>"realizas" , :action=>"cancelar"
  match "/servicos_data" , :controller=>"realizas" , :action=>"servicos_data"
  match "/atendimento" , :controller=>"realizas" , :action=>"atendimento"
  match "/funcionario_atendeu" , :controller=>"realizas" , :action=>"funcionario_atendeu"
  match "/pesquisar_usuario" , :controller=>"clientes" , :action=>"pesquisar_usuario"
  match "/confirmar_pg/:id" , :controller=>"pagamentos" , :action=>"confirmar_pg"
  match "servico/relatorio" , :controller=>"servicos" , :action=>"relatorio"
  match "servico/produtividade" , :controller=>"servicos" , :action=>"produtividade"


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
