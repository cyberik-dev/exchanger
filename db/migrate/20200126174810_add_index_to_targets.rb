class AddIndexToTargets < ActiveRecord::Migration[6.0]
  def change
    add_index :currency_pairs, :target
  end
end
