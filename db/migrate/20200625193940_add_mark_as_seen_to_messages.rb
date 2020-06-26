class AddMarkAsSeenToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :mark_as_seen, :boolean, default: false
  end
end
