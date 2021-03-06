Writingactivities::Application.routes.draw do
  devise_for :users

    root :to => 'home#home'

    get '/reverse-words', :to => 'reverse_words#reverse_words', :as => 'reverse_words'
    post '/reverse-words', :to => 'reverse_words#reverse_words'
    get '/topic-sentences', :to => 'topic_sentences#enter_paragraphs', :as => 'topic_sentences'
    post '/topic-sentences', :to => 'topic_sentences#enter_paragraphs'
    get '/reverse-sentences', :to => 'reverse_sentences#reverse_sentences', :as => 'reverse_sentences'
    post '/reverse-sentences', :to => 'reverse_sentences#reverse_sentences'

    get '/sample-text', :to => 'home#sample_text', :as => 'sample_text'

    post '/lti-tool', :to => 'lti_tool#lti_tool', :as => 'lti_test'
    post '/lti-exam', :to => 'lti_tool#lti_exam', :as => 'lti_exam'

    resources :contexts, :only => [:show] do
        resources :prompts
    end

    resources :prompts do
        resources :submissions
    end

    resources :submissions do
        resources :basic_reviews
        resources :research_introduction_reviews
    end


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
