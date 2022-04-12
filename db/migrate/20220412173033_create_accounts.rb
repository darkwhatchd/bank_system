class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.decimal :account_balance, precision: 10, scale: 2
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
