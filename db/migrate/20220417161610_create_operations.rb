class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.decimal :value, precision: 10, scale: 2
      t.datetime :operation_date
      t.references :operable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
