class CreateJoinTableTransactionTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :transactions, :tags, table_name: :transaction_tags do |t|
      t.index [:transaction_id, :tag_id]
      t.index [:tag_id, :transaction_id]
    end
  end
end
