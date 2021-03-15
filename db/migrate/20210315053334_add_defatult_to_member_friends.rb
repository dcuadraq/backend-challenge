class AddDefatultToMemberFriends < ActiveRecord::Migration[6.1]
  def change
    change_column_default :members, :friends_ids, []
  end
end
