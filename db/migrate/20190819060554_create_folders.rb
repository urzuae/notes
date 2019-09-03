class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.string :name
      t.text :description
      t.references :parent, references: :folders

      t.timestamps
    end
  end
end
