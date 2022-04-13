class AddDestinyAccountReferencesToTransfer < ActiveRecord::Migration[6.1]
  def change
    add_reference :transfers, :destiny_account, foreign_key: { to_table: :accounts }
  end
end
