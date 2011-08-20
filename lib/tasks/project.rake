namespace :project do
  desc "Rename this project."
  task :rename, :new_project_name do |t, args|
    if args[:new_project_name]
      include ActiveSupport::Inflector
      
      current_project_name = "Skillet"
      new_project_name = args[:new_project_name]
      
      puts "Renaming the project to #{new_project_name}"
      
      %w(
        config/application.rb
        config/environment.rb
        config/environments/development.rb
        config/environments/production.rb
        config/environments/staging.rb        
        config/environments/test.rb
        config/initializers/session_store.rb
        config/mongoid.yml
        config/routes.rb
        Rakefile
      ).each do |filename|
        filepath = File.expand_path("../../../#{filename}", __FILE__)
        if File.file?(filepath)
          File.open(filepath, 'r') do |f|
            changes = false
            lines = f.readlines
            lines.each do |line|
              line.gsub!(current_project_name, new_project_name)
              line.gsub!(current_project_name.underscore, new_project_name.underscore)
            end
            
            f.reopen(filepath, 'w')
            lines.each do |line|
              f.write(line)
            end
            f.close
          end
        end
      end
    else
      puts "Please provide a new name for this project. (e.g. rake project:rename[MyProject])"
    end
  end
end