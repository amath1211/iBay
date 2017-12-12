class AddSellerToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :seller, :integer
  end
end
