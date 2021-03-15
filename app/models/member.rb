class Member < ApplicationRecord
  validates :name, :url, presence: true

  def friends
    Member.where("'#{id}' = ANY (friends_ids)")
  end
end
