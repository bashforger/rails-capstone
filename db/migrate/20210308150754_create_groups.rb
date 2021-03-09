class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end