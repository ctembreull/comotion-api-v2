class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
