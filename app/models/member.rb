class Member < ApplicationRecord
  include PgSearch::Model
  validates :name, :url, presence: true

  pg_search_scope :search_topics, against: :topics

  def friends
    Member.where("'#{id}' = ANY (friends_ids)")
  end
end
