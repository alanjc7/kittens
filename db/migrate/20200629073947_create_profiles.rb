class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
