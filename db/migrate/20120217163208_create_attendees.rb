class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.references :event
      t.timestamps
    end
  end
end
