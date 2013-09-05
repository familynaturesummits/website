Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :slideshow_images, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :slideshow_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
