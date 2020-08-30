class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :trans_date, null: false
      t.decimal :amount, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
