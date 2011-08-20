class File
  def replace(pattern, string)
    full_path = File.expand_path path
    return if !File.file?(full_path)
 
    reopen(full_path, 'r')
    lines = readlines
 
    changes = false
    lines.each do |line|
      changes = true if line.gsub!(pattern, string)
    end
 
    if changes
      reopen(full_path, 'w')
      lines.each do |line|
        write(line)
      end
      close
    end
  end
end

namespace :project do
  desc "Rename this project."
  task :rename, :new_project_name do |t, args|
    if args[:new_project_name]
      include ActiveSupport::Inflector
      
      current_project_name = "Lucre"
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
          File.open(filepath) do |f|
            f.replace current_project_name, new_project_name
            f.replace current_project_name.underscore, new_project_name.underscore
          end
          # f = File.open(filepath, 'r')
          # changes = false
          # f.readlines.each do |line|
          #   changes = true if line.gsub!(pattern, string)
          # end
          # 
          # if changes
          #   f.reopen(full_path, 'w')
          #   lines.each do |line|
          #     f.write(line)
          #   end
          # end
          # 
          # f.close
        end
      end
    else
      puts "Please provide a new name for this project. (e.g. rake project:rename[MyProject])"
    end
  end
end