class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :origin, :string
      t.column :variety, :string
      t.column :notes, :string
      t.column :price, :string
      t.column :featured, :boolean, :default => false
      
      t.timestamps
    end
  end
end
