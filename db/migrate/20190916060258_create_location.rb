class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :coordinates

      t.timestamps
    end
  end
end
