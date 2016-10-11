class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthdate
      t.text :about
      #t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
