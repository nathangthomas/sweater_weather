class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :temperature
      t.float :high
      t.float :low
      t.float :humidity
      t.float :visability
      t.float :uv_index

      t.timestamps
    end
  end
end
