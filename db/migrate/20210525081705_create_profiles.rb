class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :mobile
      t.date :dob
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
