class RemoveBuyerFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :buyer, :integer
  end
end
