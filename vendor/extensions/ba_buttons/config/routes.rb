Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :ba_buttons do
    resources :ba_buttons, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :ba_buttons, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :ba_buttons, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
