class CreateCurrencyPairs < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_pairs do |t|
      t.decimal :amount
      t.integer :target
      t.integer :duration

      t.timestamps
    end
  end
end
