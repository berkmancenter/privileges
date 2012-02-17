namespace :privileges do
  namespace :bootstrap do
    desc "Add the default users"
    task :default_admin => :environment do
      user = User.new(:email => 'admin@example.com')
      if %w[development test dev local].include?(Rails.env)
        user.password = "123456"
      else
        user.password = User.random_password
      end
      user.admin = true
      user.save
      puts "Admin email is: #{user.email}"
      puts "Admin password is: #{user.password}"
    end 
    
    task :test_users => :environment do
      user1 = User.new(:email => 'test1@example.com')
      user1.password = "123456"
      user1.save
      
      user2 = User.new(:email => 'test2@example.com')
      user2.password = "123456"
      user2.save
      
      user3 = User.new(:email => 'test3@example.com')
      user3.password = "123456"
      user3.save
    end
    
    task :default_event => :environment do
      user = User.find_by_email('admin@example.com')
      event = Event.new(:user => user, :name => 'Privileges', :start_date => '2012-02-15', :end_date => '2012-12-31')
      event.save
    end
    
    desc "run all tasks in bootstrap"
    task :run_all => [:default_admin, :test_users] do
      puts "Done!"
    end
  end
end