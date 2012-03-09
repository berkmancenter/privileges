class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.string :name
      t.timestamps
    end
    
    add_index :card_types, :name
  end
end
