class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
