class AddFriendsToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :friends_ids, :integer, array: true
    add_index :members, :friends_ids, using: :gin
  end
end
