class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.references :account, null: false, foreign_key: true
      t.datetime :transfer_date
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
