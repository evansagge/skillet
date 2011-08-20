namespace :project do
  
  desc "Rename this project."
  task :rename, :new_project_name do |t, args|
    if args[:new_project_name]
      include ActiveSupport::Inflector
      
      current_project_name = "Lucre"
      new_project_name = args[:new_project_name]
      
      puts "Renaming the project to #{new_project_name.underscore}"
      
      %w(
        config/initializers/session_store.rb
        config/mongoid.yml
      ).each do
      end
    else
      puts "Please provide a new name for this project. (e.g. rake project:rename[MyProject])"
    end
  end
end

