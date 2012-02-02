class CreateNodePaths < ActiveRecord::Migration
  def change
    create_table :node_paths do |t|
      t.text :path
      t.references :borrower
      t.integer :session_id
      t.timestamps
    end
  end
end
