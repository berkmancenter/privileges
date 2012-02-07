class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    
    [:name, :user_id].each do|col|
      add_index :events, col
    end
  end
end
