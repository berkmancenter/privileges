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
  end
end
