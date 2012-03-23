class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :email
      t.string :phone
      t.date :dob
      t.date :start_date
      t.date :end_date
      t.boolean :verified, :default => false      
      t.references :event
      t.references :attendee
      t.text :other
      t.timestamps
    end
    
    [:firstname, :lastname, :email].each do|col|
      add_index :borrowers, col
    end
    
    create_table(:borrowers_card_types, :id => false) do|t|
      t.references :borrower
      t.references :card_type
    end
    
    [:borrower_id, :card_type_id].each do|col|
      add_index :borrowers_card_types, col
    end
    
    create_table(:affiliations_borrowers, :id => false) do|t|
      t.references :borrower
      t.references :affiliation
    end
    
    [:borrower_id, :affiliation_id].each do|col|
      add_index :affiliations_borrowers, col
    end
    
    create_table(:borrowers_collections, :id => false) do|t|
      t.references :borrower
      t.references :collection
    end
    
    [:borrower_id, :collection_id].each do|col|
      add_index :borrowers_collections, col
    end
  end
end
