class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.text :text
      t.boolean :first, :default => false
      t.timestamps
    end
    
    create_table(:choices_nodes, :id => false) do |t|
      t.references :choice
      t.references :node
    end
    
    add_index :nodes, :text
  end
end