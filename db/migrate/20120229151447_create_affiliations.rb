class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :name
      t.integer :rank
      t.text :message
      t.timestamps
    end
    
    add_index :affiliations, :name
    add_index :affiliations, :rank
    add_index :affiliations, :message
  end
end
