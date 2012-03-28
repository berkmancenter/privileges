class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.date :start_date
      t.date :end_date
      t.references :event
      t.timestamps
    end
    
    [:firstname, :lastname, :email, :start_date, :end_date].each do|col|
      add_index :attendees, col
    end
  end
end
