class AddUserToCurrencyPairs < ActiveRecord::Migration[6.0]
  def change
    add_reference :currency_pairs, :user, null: false, foreign_key: { on_delete: :cascade }, index: true
  end
end
