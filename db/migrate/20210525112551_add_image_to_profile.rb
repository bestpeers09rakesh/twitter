class AddImageToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :image, :string, null: true
    #Ex:- :null => false

  end
end
