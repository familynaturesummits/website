Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :faculty_members do
    resources :faculty_members, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :faculty_members, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :faculty_members, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :faculty_members do
    resources :expertise_areas, :only => [:index, :show]
  end

  # Admin routes
  namespace :faculty_members, :path => '' do
    namespace :admin, :path => 'refinery/faculty_members' do
      resources :expertise_areas, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
