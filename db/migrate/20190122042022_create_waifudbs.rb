class CreateWaifudbs < ActiveRecord::Migration[5.2]
  def change
    create_table :waifudbs do |t|
      t.string :name
      t.string :imgwaifu

      t.timestamps
    end
  end
end
