class CreateWithdrawals < ActiveRecord::Migration[6.1]
  def change
    create_table :withdrawals do |t|
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
