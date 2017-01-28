class AddCompletedAtToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :completed_at, :datetime
    add_column :links, :retries, :integer, default: 0
  end
end
