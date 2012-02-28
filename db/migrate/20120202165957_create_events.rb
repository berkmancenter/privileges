class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :canceled, :default => false
      t.timestamps
    end
    
    [:name, :user_id].each do|col|
      add_index :events, col
    end
    
    create_table(:events_users, :id => false) do|t|
      t.references :event
      t.references :user
    end
    
    [:event_id, :user_id].each do|col|
      add_index :events_users, col
    end
  end
end
