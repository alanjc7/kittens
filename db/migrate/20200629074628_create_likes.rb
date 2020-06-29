class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :by, null: false
      t.integer :score, null: false
      t.boolean :expired, null: false, default: false
      t.belongs_to :profile

      t.timestamps
    end
  end
end
