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
      
      puts "Test Users Created!" 
    end
    
    task :default_event => :environment do
      user = User.find_by_email('admin@example.com')
      event = Event.new(:name => 'Privileges', :start_date => Date.today, :end_date => '2012-12-31')
      event.save
      puts "Default Event Created!" 
    end
    
    task :default_card_types => :environment do
      ["Special Borrower Card", "Research Assistant Card", "Visiting Researcher Card", "Widener Reading Room Card", "Special Collections Card", "Government Documents Card", "University Archives Card", "MIT Undergraduate Card", "Stacks Access Card"].each do |card|
        card_type = CardType.new(:name => card)
        card_type.save
      end 
      puts "Default Card Types Created!" 
    end
    
    task :default_affiliations => :environment do
      affiliations = {1 => "Research Assistant", 2=> "Smithsonian", 3 => "House Affiliate", 4 => "Clergy", 5 => "Spouse/Domestic partner of current Harvard faculty, staff or student", 6 => "MIT Faculty or Student", 7 => "Program Participant", 8 => "Center or Organization Affiliate", 9 => "Alumna/us", 10 => "Faculty member visiting from another institution", 11 => "PhD candidate visiting from another institution", 12 => "Visiting Librarian", 13 => "Published author", 14 => "Independent Researcher", 15 => "Non-matriculated Extension student"}
      affiliations.each_key do |aff|
        affiliation = Affiliation.new(:name => affiliations[aff], :rank => aff, :message => 'Thank you for registering for library privileges.')
        affiliation.save
      end 
      puts "Default Affiliations Created!" 
    end
    
    task :default_collections => :environment do
      ["General Collections at the libraries", "Special Collections", "Government Documents", "University Archives", "Not sure yet"].each do |coll|
        collection = Collection.new(:name => coll)
        collection.save
      end 
      puts "Default Collections Created!" 
    end
    
    desc "run all tasks in bootstrap"
    task :run_all => [:default_admin, :test_users, :default_event, :default_card_types, :default_affiliations, :default_collections] do
      puts "Done!"
    end
  end
  
  namespace :cron_task do    
    desc "Send emails that are queued up"
    task :send_queued_emails => :environment do
      emails = Email.to_send
      emails.each do |email|
        begin
          Notification.send_queued(email).deliver
          email.message_sent = true
          email.date_sent = Time.now
          email.save
        rescue Exception => e
          #FAIL!
          email.error_message = e.inspect[0..4999]
          email.to_send = false
          email.save
        end
      end  
      puts "Successfully sent queued emails!" 
    end
    
    desc "run all tasks in cron_task"
    task :run_all => [:send_queued_emails] do
      puts "Sent all emails!"
    end
    
  end
end