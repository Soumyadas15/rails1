class CreateKeyValues < ActiveRecord::Migration[5.1]
  def change
    create_table :key_values do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
