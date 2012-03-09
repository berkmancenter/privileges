class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :name
      t.timestamps
    end
    
    add_index :affiliations, :name
  end
end
